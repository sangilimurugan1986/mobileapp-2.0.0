import 'package:ez/core/ApiClient/endpoint.dart';
import 'package:ez/core/CustomAppBar.dart';
import 'package:ez/core/CustomColors.dart';
import 'package:ez/core/chip.dart';
import 'package:ez/core/utils/strings.dart';
import 'package:ez/features/task_create/view/task_add.dart';
import 'package:ez/features/tasklist/model/Filter.dart';
import 'package:ez/features/tasklist/model/FilterBy.dart';
import 'package:ez/features/tasklist/model/SortBy.dart';
import 'package:ez/features/tasklist/model/taskrequest.dart';
import 'package:ez/features/tasklist/viewmodel/viewmodel.dart';
import 'package:ez/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/di/injection.dart';

class TaskListScreen extends StatefulWidget {
  TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final _biggerFont =
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  final _smallerFont = const TextStyle(fontSize: 10.0);

  final viewmodel = sl.get<TaskListViewModel>();
  // final viewmodel =
  // Provider.of<LoginViewModel>(context, listen: false);

  bool _isLoading = true;
  bool _hasMore = true;

  List<String> criteriaList = [
    'Task Name',
    'Details',
    'Environment',
    'Product_Modules',
    'Customer',
    'Task Owner',
    'Task Assign',
    'Estimation Date',
    'Start Date',
    'End Date',
    'Priority',
    'Task Status',
    'Created By',
    'Created At',
    'Modified By',
    'Modified At',
  ];
  List<String> conditionList = [
    'Is Equals To(=)',
    'Is Not Equals To(!=)',
    'Contains',
    'Is Empty({})',
    'Is Not Empty(!{})',
    'Is Any Of',
    'Is Not Any Of',
    'Not Contains',
    'Starts With',
    'Not Starts With',
    'Ends With',
    'Not Ends With',
  ];

  List<String> get _criteriaList => criteriaList;

  List<String> get _conditionList => conditionList;

  @override
  void initState() {
    _isLoading = true;
    _hasMore = true;

    String formId = "19";
    String path = EndPoint.getPath(method: "form/${formId}/entry/all");

    final requestBody = TaskRequest(
        mode: "BROWSE",
        sortBy: SortBy(criteria: "", order: "DESC"),
        groupBy: "",
        filterBy: [
          FilterBy(filters: [
            Filter(
                criteria: "type",
                condition: "IS_EQUALS_TO",
                value: "Task",
                dataType: "")
          ], groupCondition: "")
        ],
        itemsPerPage: Strings.K_MAX_RECORDS_PER_PAGE,
        currentPage: 1);
    viewmodel.getTaskList(requestBody, EndPoint.api_taskList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings.txt_header_taskscreen,
        actions: [
          AppBarAction(onPressed: () {}, icon: Icon(Icons.delete_forever)),
          AppBarAction(
              icon: const Icon(Icons.tune),
              onPressed: () async {
                _showFilterDialog(_criteriaList, _conditionList);
              }),
          AppBarAction(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TaskCreate()));
              },
              icon: Icon(Icons.add))
        ],
        backgroundColor: CustomColors.white,
      ),
      body: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return listRow(index);
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
            height: 0.1, color: CustomColors.grey, indent: 20, endIndent: 30),
      ),
    );
  }

  Widget listRow(int index) {
    return Dismissible(
      background: Container(
          color: CustomColors.red,
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () {},
          )),
      key: UniqueKey(),
      onDismissed: (direction) {
        // Remove the item from the data source.
        _criteriaList.remove(index);
        setState(() {});

        // Then show a snackbar.
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("arun@ezofis.com",
                    overflow: TextOverflow.ellipsis, style: _biggerFont),
                SizedBox(width: 10),
                Text("(Owner)",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14)),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    size: 15,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                Text("sangili.murugan@ezofis.com",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14)),
                SizedBox(width: 10),
                Text("(Assigned)",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14)),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit, size: 15)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("Status",
                    overflow: TextOverflow.ellipsis, style: _smallerFont),
                SizedBox(width: 10),
                Text("Completed",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: CustomColors.red)),
                Spacer(),
                Text("Oct 30 2023", style: _smallerFont),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showFilterDialog(List<String> criteriaList, List<String> conditionList) {
    // List of items in our dropdown menu

    List<String>? _selectedCriteria = [];

    List<String>? _selectedCondition = [];
    ScrollController _scrollController = ScrollController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(
            content: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Row(children: [
                    Text(Strings.txt_header_criteria, style: _biggerFont),
                    Spacer(),
                    Text(
                        _selectedCriteria!.isEmpty
                            ? Strings.txt_label_mandatory
                            : "",
                        style:
                            TextStyle(fontSize: 10, color: CustomColors.red)),
                  ]),
                  MultiSelectChip(
                    criteriaList,
                    onSelectionChanged: (criteriaList) {
                      this.setState(() {
                        _selectedCriteria = criteriaList;
                      });
                    },
                  ),
                  Row(children: [
                    Text(Strings.txt_header_condition, style: _biggerFont),
                    Spacer(),
                    Text(
                        _selectedCondition!.isEmpty
                            ? Strings.txt_label_mandatory
                            : "",
                        style:
                            TextStyle(fontSize: 10, color: CustomColors.red)),
                  ]),
                  MultiSelectChip(
                    criteriaList,
                    onSelectionChanged: (conditionList) {
                      setState(() {
                        _selectedCondition = conditionList;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Text(Strings.txt_header_value, style: _biggerFont),
                      Spacer(),
                      Text(
                          _selectedCriteria!.isEmpty
                              ? Strings.txt_label_mandatory
                              : "",
                          style:
                              TextStyle(fontSize: 10, color: CustomColors.red)),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: CustomColors.sapphireBlue, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: CustomColors.sapphireBlue, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: '',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _selectedCriteria?.clear();
                    _selectedCondition?.clear();
                    Navigator.of(context).pop();
                  },
                  child: Text(Strings.txt_cancel_button)),
              TextButton(
                child: Text(Strings.txt_apply_button),
                onPressed: () {
                  if (_selectedCriteria!.isEmpty) {
                    _scrollController.animateTo(
                      0,
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                    );
                  } else if (_selectedCondition!.isEmpty) {
                    _scrollController.animateTo(
                      500,
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                    );
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        });
  }

  // Triggers fecth() and then add new items or change _hasMore flag and isMore flag
  void _loadMore() {}
}

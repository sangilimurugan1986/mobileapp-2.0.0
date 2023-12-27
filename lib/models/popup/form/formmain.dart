import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ez/models/popup/controllers/popupfullpagecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../../api/auth_repo.dart';
import '../../../controllers/browse_view_controller.dart';
import '../../../utils/helper/aes_encryption.dart';
import '../../../utils/helper/safe_area.dart';
import 'components/Labels.dart';
import 'components/Tabmain.dart';
import 'components/bottomup_table.dart';
import 'components/check_box_input.dart';
import 'components/date_input.dart';
import 'components/datetime_input.dart';
import 'components/divider.dart';
import 'components/dropdown_main.dart';
import 'components/dropdown_main_api.dart';
import 'components/formbutton.dart';
import 'components/number_increment.dart';
import 'components/panel.dart';
import 'components/text_input.dart';
import 'components/textbold.dart';
import 'components/textnormal.dart';
import 'components/time_input.dart';
import 'controllers/panel_controller.dart';
import 'formmaintab.dart';

class FormMain extends StatefulWidget {
  FormMainState createState() => FormMainState();
}

class FormMainState extends State<FormMain> {
  final isLoading = false.obs;
  final error = ''.obs;

  Widget child = Container();

  Map mdataGenerate = Map<String, dynamic>();
  Map datas = Map<String, dynamic>();
  final controller = Get.put(PanelController());
  final controllerpopup = Get.put(PopupFullPageController());
  final controllerPanel = Get.put(PanelController());

//479
/*  List<dynamic> datadrop =List.empty();
  List<String> datadropString =List.empty();*/
  // String sFormId = '2039'; //3061-card 23  27s 3065 4071-CLASSIC 3042-card 3043 -card  3044 -table

  @override
  void initState() {
    super.initState();
    getComponentDetails(controllerPanel.sFormId); //3061 23  27s 3065  3040-table
  }

  Future getComponentDetails(String formId) async {
    isLoading.value = true;

    error.value = '';
    try {
      final response = await AuthRepo.getInboxSingleDetails(formId); //23 formids
      Map<String, dynamic> data = jsonDecode(AaaEncryption.decryptAESaaa(response.data));
      print('');
      setState(() {
        isLoading.value = false;
        mdataGenerate = data;
        datas = json.decode(data['formJson']);
      });
      setState(() {
        isLoading.value = false;
      });

      if (response.statusCode == 200) {
      } else {
        throw 'invalid status code';
      }
    } on DioError catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode == 401) {
        error.value = 'Unauthorized Login';
      }
      if (statusCode == 402) {
        error.value = 'license expired';
      } else if (statusCode == 404) {
        error.value = 'email not found';
      } else if (statusCode == 409) {
        error.value = 'incorrect password';
      } else {
        rethrow;
      }
    } catch (e) {
      print(e);
      error.value = 'error logging in';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading.isFalse
        ? mdataGenerate['layout'].toString() == 'CLASSIC'
            ? Scaffold(
                body: Container(
                color: Color.fromRGBO(240, 245, 249, 1), //rgb(240 245 249)
                // margin: EdgeInsets.all(5),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                        backgroundColor: Colors.white,
                        pinned: true,
                        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Textbold(sLabel: mdataGenerate['name'].toString()),
                          mdataGenerate['description'].toString().length > 0
                              ? TextNormal(sLabel: mdataGenerate['description'].toString())
                              : Container(),
                        ])),
                    //Container(child: TabMain()),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: StickyHeader(
                                header: '${datas['panels'][index]['settings']['title']}'
                                                .toString()
                                                .length >
                                            0 ||
                                        '${datas['panels'][index]['settings']['description']}'
                                                .toString()
                                                .length >
                                            0
                                    ? Container(
                                        child: Panel(
                                            sVisible: true,
                                            sHeading:
                                                '${datas['panels'][index]['settings']['title']}'
                                                        .toString() +
                                                    "  " +
                                                    mdataGenerate['layout'].toString(),
                                            sDescription:
                                                '${datas['panels'][index]['settings']['description']}'
                                                    .toString()))
                                    : Container(),
                                content: ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      Container(
                                        // margin: EdgeInsets.only(bottom: 10),
                                        //  color: Colors.lightBlueAccent,
                                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        margin: EdgeInsets.only(top: 5, bottom: 10),
                                        child: Expanded(
                                            child: MediaQuery.removePadding(
                                                context: context,
                                                removeTop: true,
                                                child: GridView.builder(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemCount:
                                                      datas['panels'][index]['fields'].length,
                                                  shrinkWrap: true,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisSpacing: 1.0,
                                                          crossAxisCount:
                                                              (MediaQuery.of(context).orientation ==
                                                                      Orientation.portrait)
                                                                  ? 1
                                                                  : 2,
                                                          childAspectRatio: MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              (MediaQuery.of(context).size.height /
                                                                  8)),
                                                  itemBuilder:
                                                      (BuildContext context, int indexwidget) {
                                                    return Container(
                                                        // color: Colors.yellow, 3750 tif unproce
                                                        //margin: EdgeInsets.all(1),
                                                        child: ListView(
                                                      physics: NeverScrollableScrollPhysics(),
                                                      // 126 111 103  63.2/57    25/22.5
                                                      children: [
                                                        loadWidgets(
                                                            index,
                                                            indexwidget,
                                                            datas['panels'][index]['fields']
                                                                [indexwidget]['type']),
                                                        SizedBox(height: 10),
                                                      ],
                                                    ));
                                                  },
                                                ))),
                                      ),
                                      mdataGenerate['layout'].toString() == 'CLASSIC'
                                          ? Container(
                                              padding: EdgeInsets.fromLTRB(0, 1, 10, 1),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    /*                                                  TextButton(
                                                      onPressed: () => {},
                                                      child: new Text('Previous',
                                                          style: const TextStyle(
                                                              color: Color(0xFF643094),
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold)),
                                                    ),*/
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.of(context).pop(false),
                                                      child: FormButton(
                                                        isRounded: false,
                                                        isFullWidth: true,
                                                        label: 'Save',
                                                        isLoading: controller.isLoading.value,
                                                        onPressed: controller.login,
                                                      ),
                                                    )
                                                  ]))
                                          : Container()
                                    ]))),
                        childCount: datas['panels']
                            .length, //item['settings']['title'] // Replace with your desired item count
                      ),
                    )
                  ],
                ),
              ))
            : FormMainTab(
                formdatas: datas,
              )
        : Container(
            //
            height: 200,
            color: Colors.white,
            alignment: Alignment.center,
            child: DefaultTextStyle(
                style: TextStyle(decoration: TextDecoration.none),
                child: Text('Loading',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))));
  }

  Widget loadWidgets(int iPanel, int indexwidget, String widgetType) {
    Widget child = Container();
    switch (widgetType) {
      case 'LABEL':
        child = Container(
            //color: Colors.red,
            child: Labels(
                sLabel: datas['panels'][iPanel]['fields'][indexwidget]['label'], bRequired: false));
        break;
      case 'DIVIDER':
//        child = Divider(color: Colors.grey.shade300);s
        child = Dividers(
            sType: datas['panels'][iPanel]['fields'][indexwidget] //26 - 11,
                ['settings']['general']['dividerType']);
        break;
      case 'SHORT_TEXT':
        child = TextInput(
          borderColor: const Color(0xFFE0E0E0),
          initialValue: '',
          label: datas['panels'][iPanel]['fields'][indexwidget]['label'],
          hasError: controller.hasTextError.value,
          icon: null,
          keyboardType: getInputType(datas['panels'][iPanel]['fields'][indexwidget]['settings']
              ['validation']['contentRule']),
          onChanged: controller.onTextChanged,
          bOptional: datas['panels'][iPanel]['fields'][indexwidget]['settings']['validation']
                  ['fieldRule'] ==
              'REQUIRED',
          placeholder: '',
        );
        break;
      case 'COUNTER':
        child = NumberInput(
          borderColor: const Color(0xFFE0E0E0),
          initialValue: '',
          label: datas['panels'][iPanel]['fields'][indexwidget]['label'],
          hasError: controller.hasNumberError.value,
          icon: null,
          keyboardType: getInputType(datas['panels'][iPanel]['fields'][indexwidget]['settings']
              ['validation']['contentRule']),
          onChanged: controller.onNumberChanged,
          bOptional: datas['panels'][iPanel]['fields'][indexwidget]['settings']['validation']
                  ['fieldRule'] ==
              'REQUIRED',
          placeholder: '',
        );
        break;
      case 'NUMBER': // 'NUMBER'
        child = TextInput(
          borderColor: const Color(0xFFE0E0E0),
          initialValue: '',
          label: datas['panels'][iPanel]['fields'][indexwidget]['label'],
          hasError: controller.hasNumberError.value,
          icon: null,
          keyboardType: getInputType(datas['panels'][iPanel]['fields'][indexwidget]['settings']
              ['validation']['contentRule']),
          onChanged: controller.onNumberChanged,
          bOptional: datas['panels'][iPanel]['fields'][indexwidget]['settings']['validation']
                  ['fieldRule'] ==
              'REQUIRED',
          placeholder: '',
        );
        break;
      case 'LONG_TEXT':
        child = TextInput(
          borderColor: const Color(0xFFE0E0E0),
          initialValue: '',
          label: datas['panels'][iPanel]['fields'][indexwidget]['label'],
          hasError: controller.hasMultiLineError.value,
          icon: null,
          keyboardType: TextInputType.multiline,
          onChanged: controller.onMultilineChanged,
          bOptional: datas['panels'][iPanel]['fields'][indexwidget]['settings']['validation']
                  ['fieldRule'] ==
              'REQUIRED',
          placeholder: '',
          maxLines: 2,
        );
        break;

      //Date Time Components
      case 'DATE':
        child = DateTimeInput(
          initialValue: '',
          label: datas['panels'][iPanel]['fields'][indexwidget]['label'],
          isDisabled: true,
          onChangedDate: (value) => controller.ondateandtime_DateChanged,
          onChangedTime: (value) => controller.ondateandtime_TimeChanged,
          placeholder: datas['panels'][iPanel]['fields'][indexwidget] //26 - 11,
              ['settings']['general']['placeholder'],
          // datas['panels'][iPanel]['fields'][indexwidget]['general']            ['placeholder']
        );
        break;
      case 'DATETIME':
        child = DateInput(
          initialValue: '',
          label: datas['panels'][iPanel]['fields'][indexwidget]['label'],
          isDisabled: true,
          onChanged: (value) => controller.onDateChanged,
          placeholder: datas['panels'][iPanel]['fields'][indexwidget]['settings']['general']
              ['placeholder'],
          // datas['panels'][iPanel]['fields'][indexwidget]['general']            ['placeholder']
        );
        break;

      case 'TIME':
        child = TimeInput(
          initialValue: '',
          label: datas['panels'][iPanel]['fields'][indexwidget]['label'],
          isDisabled: true,
          onChanged: (value) => controller.onDateChanged,
          placeholder: datas['panels'][iPanel]['fields'][indexwidget]['settings']['general']
              ['placeholder'],
          // datas['panels'][iPanel]['fields'][indexwidget]['general']            ['placeholder']
        );
        break;
      // Option - DropDown
      case 'SINGLE_SELECT':
        child = DropdownOptions(iPanel, indexwidget);
        break;
      case 'MULTIPLE_CHOICE':
        child = CheckBoxInput(
          initialValue: '',
          //controller.formFieldsModel[field.name],
          isDisabled: false,
          // controller.activeTab != 'Inbox',
          options: datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']
                  ['customOptions']
              .toString()
              .split(','),
          //field.options.split(','),
          slabel: datas['panels'][iPanel]['fields'][indexwidget]['label'],
          bOptional: datas['panels'][iPanel]['fields'][indexwidget]['settings']['validation']
                  ['fieldRule'] !=
              'REQUIRED',
          onChanged: (value) => controller.onFormFieldChanged(
              value.join(','), datas['panels'][iPanel]['fields'][indexwidget]['label']),
        );
        break;
      case 'TABLE':
        child = BottomUpTable();
        break;

      default:
        child = Container(
            child: Labels(
                sLabel: widgetType + ' ' + datas['panels'][iPanel]['fields'][indexwidget]['label'],
                bRequired: false));
        break;
    }
    return child;
  }

  //dropdown Options
  Widget DropdownOptions(
    int iPanel,
    int indexwidget,
  ) {
    //finny
    child = Container();
    if (datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']['optionsType'] ==
        'CUSTOM') {
      child = DropDownMain(
        borderColor: const Color(0xFFE0E0E0),
        initialValue: '',
        label: datas['panels'][iPanel]['fields'][indexwidget]['label'],
        sColumnName: datas['panels'][iPanel]['fields'][indexwidget]['id'],
        hasError: controller.hasNumberError.value,
        icon: null,
        keyboardType: getInputType(datas['panels'][iPanel]['fields'][indexwidget]['settings']
            ['validation']['contentRule']),
        onChanged: controller.onNumberChanged,
        bOptional: datas['panels'][iPanel]['fields'][indexwidget]['settings']['validation']
                ['fieldRule'] ==
            'REQUIRED',
        placeholder: '',
        sInputs: datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']
            ['customOptions'],
        sInputSeperator: datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']
            ['separateOptionsUsing'],
        sDropDownType: datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']
            ['optionsType'],
      );
    }

    if (datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']['optionsType'] ==
            'EXISTING' &&
        !datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']
            ['allowToAddNewOptions']) {
      controller.getDropDownValues(controllerPanel.sFormId,
          datas['panels'][iPanel]['fields'][indexwidget]['id'], iPanel, indexwidget, false);
      child = DropDownMainAPI(
          borderColor: const Color(0xFFE0E0E0),
          initialValue: '',
          label: datas['panels'][iPanel]['fields'][indexwidget]['label'],
          sColumnName: datas['panels'][iPanel]['fields'][indexwidget]['id'],
          hasError: controller.hasNumberError.value,
          icon: null,
          keyboardType: getInputType(datas['panels'][iPanel]['fields'][indexwidget]['settings']
              ['validation']['contentRule']),
          onChanged: controller.onNumberChanged,
          bOptional: datas['panels'][iPanel]['fields'][indexwidget]['settings']['validation']
                  ['fieldRule'] ==
              'REQUIRED',
          placeholder: '',
          /*  sInputs: datas['panels'][iPanel]['fields'][indexwidget]['settings']
            ['specific']['customOptions'],*/
          sInputs: controller.datadropString,
          sInputSeperator: datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']
              ['separateOptionsUsing'],
          sDropDownType: datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']
              ['optionsType']); //125 110 102 332
    }
/////////////////////////// with textfield
    if (datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']['optionsType'] ==
            'EXISTING' &&
        datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']
            ['allowToAddNewOptions']) {
/*      controller.getDropDownValues(sFormId,datas['panels'][iPanel]['fields'][indexwidget]['id'],
          iPanel, indexwidget, true);*/
      child = DropDownMainAPI(
          borderColor: const Color(0xFFE0E0E0),
          initialValue: '',
          label: datas['panels'][iPanel]['fields'][indexwidget]['label'],
          sColumnName: datas['panels'][iPanel]['fields'][indexwidget]['id'],
          hasError: controller.hasNumberError.value,
          icon: null,
          keyboardType: getInputType(datas['panels'][iPanel]['fields'][indexwidget]['settings']
              ['validation']['contentRule']),
          onChanged: controller.onNumberChanged,
          bOptional: datas['panels'][iPanel]['fields'][indexwidget]['settings']['validation']
                  ['fieldRule'] ==
              'REQUIRED',
          placeholder: '',
          sInputs: controller.datadropString,
          sInputSeperator: datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']
              ['separateOptionsUsing'],
          sDropDownType: datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']
              ['optionsType']);
    }
    return child;
  }

  //TextInputType
  TextInputType getInputType(String sKeyboardType) {
    TextInputType keyboardType = TextInputType.text;

    switch (sKeyboardType) {
      case 'TEXT':
        keyboardType = TextInputType.text;
        break;
      case 'DECIMAL':
        keyboardType = TextInputType.number;
        break;
      case 'EMAIL':
        keyboardType = TextInputType.emailAddress;
        break;
      case 'NAME':
        keyboardType = TextInputType.name;
        break;
    }
    return keyboardType;
  }
}

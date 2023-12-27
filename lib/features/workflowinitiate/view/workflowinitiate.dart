import 'package:ez/core/snackbar/snack_bar.dart';
import 'package:ez/core/utils/extension+Strings.dart';
import 'package:ez/features/qr_scanner/view/qrscanner.dart';
import 'package:ez/features/workflow/workflowcreate/view/workflowcreate.dart';
import 'package:ez/features/workflowinitiate/viewmodel/viewmodel.dart';
import 'package:ez/widgets/AlertDialogScreen.dart';
import 'package:ez/widgets/button.dart';
import 'package:ez/widgets/testinbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../core/CustomAppBar.dart';
import '../../../core/CustomColors.dart';
import '../../../core/utils/strings.dart';
import '../../../models/popup/form/components/Labels.dart';
import '../../../models/popup/form/components/bottomup_table.dart';
import '../../../models/popup/form/components/check_box_input.dart';
import '../../../models/popup/form/components/date_input.dart';
import '../../../models/popup/form/components/datetime_input.dart';
import '../../../models/popup/form/components/divider.dart';
import '../../../models/popup/form/components/dropdown_main.dart';
import '../../../models/popup/form/components/dropdown_main_api.dart';
import '../../../models/popup/form/components/number_increment.dart';
import '../../../models/popup/form/components/text_input.dart';
import '../../../models/popup/form/components/time_input.dart';
import '../../../models/popup/form/controllers/panel_controller.dart';
import '../../../routes.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class WorkflowInitiate extends StatefulWidget {
  const WorkflowInitiate({Key? key}) : super(key: key);

  @override
  State<WorkflowInitiate> createState() => _WorkflowInitiateState();
}

class _WorkflowInitiateState extends State<WorkflowInitiate> {
  final controller = Get.put(PanelController());
  dynamic dataSet = [];
  dynamic datas = [];
  Widget child = Container();
  List listofAttachedWorkflows = [];

  @override
  void initState() {
    final viewModel =
        Provider.of<WorkflowInitiateViewModel>(context, listen: false);
    viewModel.fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<WorkflowInitiateViewModel>(context);
    dataSet = viewmodel.dataSet;
    datas = viewmodel.panels;
    final List<Widget> _children = [classicWidget(viewmodel, datas)];

    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        actions: [],
        backgroundColor: CustomColors.white,
      ),
      body: (viewmodel.loading)
          ? Center(child: CircularProgressIndicator())
          : viewmodel.dataSet.layout == Strings.txt_layout_classic
              ? _children[0]
              : Center(child: CircularProgressIndicator()),
    );
  }

  Widget classicWidget(WorkflowInitiateViewModel viewmodel, dynamic datas) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: viewmodel.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : viewmodel.errorMessage.isNotEmpty
                    ? Center(
                        child: Text(viewmodel.errorMessage),
                      )
                    : ListView(children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: datas?.panels[0].fields.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: loadWidgets(0, index,
                                      datas.panels[0].fields[index].type));
                            }),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Spacer(),
                              Button(
                                  label: Strings.txt_save_button,
                                  onPressed: () {
                                    Snack.successSnack(
                                        context, Strings.alert_on_save);
                                  }),
                              Spacer(),
                              Button(
                                  label: Strings.txt_submit_button,
                                  onPressed: () {
                                    final message =
                                        FieldValidation.validateformFields(
                                            datas.panels[0].fields,
                                            viewmodel.dataSet.controllist);
                                    Snack.errorSnack(context, message);
                                  }),
                              Spacer(),
                            ],
                          ),
                        ),
                      ]),
          ),
        ],
      ),
    );
  }

  Widget loadWidgets(int iPanel, int indexwidget, String widgetType) {
    Widget child;

    switch (widgetType) {
      case Strings.label:
        child = Container(
            //color: Colors.red,
            child: Labels(
                sLabel: datas.panels[iPanel].fields[indexwidget].label,
                bRequired: false));
        break;
      case Strings.divider:
        child = Dividers(
            sType: datas.panels[iPanel].fields[indexwidget].settings.general
                .dividerType);
        break;
      case Strings.shortText:
        child = TextInput(
          borderColor: CustomColors.grey,
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          hasError: controller.hasTextError.value,
          icon: null,
          keyboardType: getInputType(datas.panels[iPanel].fields[indexwidget]
              .settings.validation.contentRule),
          onChanged: controller.onTextChanged,
          bOptional: datas.panels[iPanel].fields[indexwidget].settings
                  .validation.fieldRule ==
              Strings.required,
          placeholder: '',
        );
        break;
      case Strings.counter:
        child = NumberInput(
            borderColor: CustomColors.grey,
            initialValue: '',
            label: datas.panels[iPanel].fields[indexwidget].label,
            hasError: controller.hasNumberError.value,
            icon: null,
            keyboardType: getInputType(datas.panels[iPanel].fields[indexwidget]
                .settings.validation.contentRule),
            onChanged: controller.onNumberChanged,
            bOptional: datas.panels[iPanel].fields[indexwidget].settings
                    .validation.fieldRule ==
                Strings.required,
            placeholder: '');
        break;
      case Strings.number: // 'NUMBER'
        child = TextInput(
          borderColor: CustomColors.grey,
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          hasError: controller.hasNumberError.value,
          icon: null,
          keyboardType: getInputType(datas.panels[iPanel].fields[indexwidget]
              .settings.validation.contentRule),
          onChanged: controller.onNumberChanged,
          bOptional: datas.panels[iPanel].fields[indexwidget].settings
                  .validation.fieldRule ==
              Strings.required,
          placeholder: '',
        );
        break;
      case Strings.longText:
        child = TextInput(
          borderColor: CustomColors.grey,
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          hasError: controller.hasMultiLineError.value,
          icon: null,
          keyboardType: TextInputType.multiline,
          onChanged: controller.onMultilineChanged,
          bOptional: datas.panels[iPanel].fields[indexwidget].settings
                  .validation.fieldRule ==
              Strings.required,
          placeholder: '',
          maxLines: 2,
        );
        break;

      //Date Time Components
      case Strings.date:
        child = DateTimeInput(
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          isDisabled: true,
          onChangedDate: (value) => controller.ondateandtime_DateChanged,
          onChangedTime: (value) => controller.ondateandtime_TimeChanged,
          placeholder: datas
              .panels[iPanel].fields[indexwidget].settings.general.placeholder,
        );
        break;
      case Strings.dateTime:
        child = DateInput(
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          isDisabled: true,
          onChanged: (value) => controller.onDateChanged,
          placeholder: datas
              .panels[iPanel].fields[indexwidget].settings.general.placeholder,
        );
        break;

      case Strings.time:
        child = TimeInput(
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          isDisabled: true,
          onChanged: (value) => controller.onDateChanged,
          placeholder: datas
              .panels[iPanel].fields[indexwidget].settings.general.placeholder,
        );
        break;
      // Option - DropDown
      case Strings.singleSelect:
        child = DropdownOptions(iPanel, indexwidget);
        break;
      case Strings.multipleSelect:
        child = CheckBoxInput(
            initialValue: '',
            //controller.formFieldsModel[field.name],
            isDisabled: false,
            // controller.activeTab != 'Inbox',
            options: datas.panels[iPanel].fields[indexwidget].settings.specific
                .customOptions
                .toString()
                .split(','),
            slabel: datas.panels[iPanel].fields[indexwidget].label,
            bOptional: datas.panels[iPanel].fields[indexwidget]
                    .settingsvalidation.fieldRule !=
                Strings.required,
            onChanged: (value) => controller.onFormFieldChanged(
                  value.join(','),
                  datas.panels[iPanel].fields[indexwidget].label,
                ));
        break;
      case Strings.table:
        // child = BottomUpTable();
        child =
            dynamic_workflowContainer(datas.panels[iPanel].fields[indexwidget]);
        break;
      case Strings.signature:
        child = Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: SfSignaturePad(),
        );
        break;
      default:
        child = Container(
            child: Labels(
                sLabel: widgetType +
                    ' ' +
                    datas.panels[iPanel].fields[indexwidget].label,
                bRequired: false));
        break;
    }
    return child;
  }

  Widget DropdownOptions(int iPanel, int indexwidget) {
    child = Container();

    if (datas
            .panels[iPanel].fields[indexwidget].settings.specific.optionsType ==
        Strings.custom) {
      child = DropDownMain(
        borderColor: CustomColors.grey,
        initialValue: '',
        label: datas.panels[iPanel].fields[indexwidget].label,
        sColumnName: datas.panels[iPanel].fields[indexwidget].id,
        hasError: controller.hasNumberError.value,
        icon: null,
        keyboardType: getInputType(datas.panels[iPanel].fields[indexwidget]
            .settings.validation.contentRule),
        onChanged: controller.onNumberChanged,
        bOptional: datas.panels[iPanel].fields[indexwidget].settings.validation
                .fieldRule ==
            Strings.required,
        placeholder: '',
        sInputs: datas
            .panels[iPanel].fields[indexwidget].settings.specific.customOptions,
        sInputSeperator: datas.panels[iPanel].fields[indexwidget].settings
            .specific.separateOptionsUsing,
        sDropDownType: datas
            .panels[iPanel].fields[indexwidget].settings.specific.optionsType,
      );
    }

    if (datas.panels[iPanel].fields[indexwidget].settings.specific
                .optionsType ==
            Strings.existing &&
        !datas.panels[iPanel].fields[indexwidget].settings.specific
            .allowToAddNewOptions) {
      controller.getDropDownValues(
          controller.sFormId,
          datas.panels[iPanel].fields[indexwidget].id,
          iPanel,
          indexwidget,
          false);
      child = DropDownMainAPI(
          borderColor: CustomColors.grey,
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          sColumnName: datas.panels[iPanel].fields[indexwidget].id,
          hasError: controller.hasNumberError.value,
          icon: null,
          keyboardType: (datas.panels[iPanel].fields[indexwidget].settings
                      .validation.contentRule ==
                  Strings.text)
              ? TextInputType.text
              : TextInputType.number,
          onChanged: controller.onNumberChanged,
          bOptional: datas.panels[iPanel].fields[indexwidget].settings
                  .validation.fieldRule ==
              Strings.required,
          placeholder: '',
          sInputs: controller.datadropString,
          sInputSeperator: datas.panels[iPanel].fields[indexwidget].settings
              .specific.separateOptionsUsing,
          sDropDownType: datas.panels[iPanel].fields[indexwidget].settings
              .specific.optionsType);
    }

    if (datas.panels[iPanel].fields[indexwidget].settings.specific
                .optionsType ==
            Strings.existing &&
        datas.panels[iPanel].fields[indexwidget].settings.specific
            .allowToAddNewOptions) {
      child = DropDownMainAPI(
          borderColor: CustomColors.grey,
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          sColumnName: datas.panels[iPanel].fields[indexwidget].id,
          hasError: controller.hasNumberError.value,
          icon: null,
          keyboardType: getInputType(datas.panels[iPanel].fields[indexwidget]
              .settings.validation.contentRule),
          onChanged: controller.onNumberChanged,
          bOptional: datas.panels[iPanel].fields[indexwidget].settings
                  .validation.fieldRule ==
              Strings.required,
          placeholder: '',
          sInputs: controller.datadropString,
          sInputSeperator: datas.panels[iPanel].fields[indexwidget].settings
              .specific.separateOptionsUsing,
          sDropDownType: datas.panels[iPanel].fields[indexwidget].settings
              .specific.optionsType);
    }
    return child;
  }

  //TextInputType
  TextInputType getInputType(String sKeyboardType) {
    TextInputType keyboardType = TextInputType.text;

    switch (sKeyboardType) {
      case Strings.text:
        keyboardType = TextInputType.text;
        break;
      case Strings.decimal:
        keyboardType = TextInputType.number;
        break;
      case Strings.email:
        keyboardType = TextInputType.emailAddress;
        break;
      case Strings.name:
        keyboardType = TextInputType.name;
        break;
    }
    return keyboardType;
  }

  Widget dynamic_workflowContainer(dynamic data) {
    late Widget child;
    // if qrvalue equals to false and tableRowsType == ON_DEMAND
    child = Column(
      children: [
        Row(
          children: [
            Labels(bRequired: false, sLabel: data.label),
            Spacer(),
            ElevatedButton(
                onPressed: (!data.settings.specific.qrValue &&
                            data.settings.specific.tableRowsType ==
                                Strings.fixed &&
                            data.settings.specific.tableFixedRowCount ==
                                listofAttachedWorkflows.length ||
                        !data.settings.specific.qrValue &&
                            data.settings.specific.tableRowsType ==
                                Strings.ondemand)
                    ? () {
                        AppRoutes.present(
                          context,
                          WorkflowCreate(
                            datas: data,
                            isEdit: false,
                          ),
                          (val) {
                            setState(() {
                              if (val != null) {
                                // ignore adding values when there is null exists, this situation may ariase when user click on cancel button of window
                                listofAttachedWorkflows.add(val);
                              }
                            });
                          },
                        );
                      }
                    : AppRoutes.present(context, QrScanner(), (val) {
                        debugPrint(val);
                      }),
                child: Text(Strings.txt_add_button,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold)))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: dynamicListView(data),
        )
      ],
    );

    return child;
  }

  // This method is used to create dynamic List of Workflow (type :- Table)
  Widget dynamicListView(dynamic data) {
    late Widget child;
    child = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.lime),
      child: Column(
        children: [
          for (int i = 0; i < listofAttachedWorkflows.length; i++)
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: ColoredBox(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              AppRoutes.present(
                                  context,
                                  WorkflowCreate(
                                    datas: data,
                                    isEdit: true,
                                    datas_onEdit: listofAttachedWorkflows[i],
                                  ),
                                  (val) {});
                            },
                            child: Text(
                              listofAttachedWorkflows[0][i]['id'],
                            ),
                          )
                        ],
                      )),
                      Spacer(),
                      Container(width: 1, height: 30, color: Colors.grey),
                      IconButton(
                          onPressed: () {
                            AlertDialogScreen(
                                title: Strings.alert_delete_title,
                                body: Strings.alert_delete_body,
                                onTap: (val) {
                                  setState(() {
                                    listofAttachedWorkflows.removeAt(i);
                                  });
                                }).showAlertDialog(context);
                          },
                          icon: Icon(Icons.delete,
                              color: CustomColors.sapphireBlue)),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
    return child;
  }

  String validateformFields(var panels, var controls) {
    String errorMessage = "";

    for (var panel in panels) {
      final index = controls.indexWhere((f) => f.jsonId == panel.id);
      if (index >= 0 && controls[index].isMandatory) {
        errorMessage +=
            "${controls[index].name} ${Strings.alert_required_field}";
        break;
      }
    }
    debugPrint(errorMessage);
    return errorMessage;
  }

  @override
  void dispose() {
    controller.dispose();
    // listofAttachedWorkflows.clear();
    super.dispose();
  }
}

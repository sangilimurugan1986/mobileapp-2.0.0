import 'dart:convert';

import 'package:ez/core/CustomColors.dart';
import 'package:ez/core/utils/strings.dart';
import 'package:ez/features/workflow/view_model/viewmodel.dart';
import 'package:ez/layouts/process/widgets/main_drawer.dart';
import 'package:ez/routes.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../core/CustomAppBar.dart';
import '../../../core/v5/models/popup/form/components/Labels.dart';
import '../../../core/v5/models/popup/form/components/bottomup_table.dart';
import '../../../core/v5/models/popup/form/components/check_box_input.dart';
import '../../../core/v5/models/popup/form/components/date_input.dart';
import '../../../core/v5/models/popup/form/components/datetime_input.dart';
import '../../../core/v5/models/popup/form/components/divider.dart';
import '../../../core/v5/models/popup/form/components/dropdown_main.dart';
import '../../../core/v5/models/popup/form/components/dropdown_main_api.dart';
import '../../../core/v5/models/popup/form/components/number_increment.dart';
import '../../../core/v5/models/popup/form/components/text_input.dart';
import '../../../core/v5/models/popup/form/components/time_input.dart';
import '../../../core/v5/models/popup/form/controllers/panel_controller.dart';
import '../../../core/v5/widgets/button.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

class Workflow extends StatefulWidget {
  const Workflow({Key? key}) : super(key: key);

  @override
  State<Workflow> createState() => _FormBuilderState();
}

class _FormBuilderState extends State<Workflow> {
  dynamic datas = [];
  final controller = Get.put(PanelController());
  Widget child = Container();

  @override
  void initState() {
    print('Page Workflow');
    SVProgressHUD.show(status: "");
    final viewModel = Provider.of<WorkflowViewModel>(context, listen: false);
    viewModel.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<WorkflowViewModel>(context);
    datas = viewmodel.panel;

    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        actions: [],
        backgroundColor: CustomColors.white,
      ),
      body: Container(
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
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: datas?.panels[0].fields.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: const EdgeInsets.all(8),
                                child: loadWidgets(0, index, datas.panels[0].fields[index].type));
                          }),
            ),
            Button(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    AppRoutes.push(context, AppRoutes.workflowinitiate);
                  });
                },
                label: Strings.txt_next_button),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }

  Widget loadWidgets(int iPanel, int indexwidget, String widgetType) {
    Widget child;
    switch (widgetType) {
      case Strings.label:
        child = Container(
            //color: Colors.red,
            child:
                Labels(sLabel: datas.panels[iPanel].fields[indexwidget].label, bRequired: false));
        break;
      case Strings.divider:
        child =
            Dividers(sType: datas.panels[iPanel].fields[indexwidget].settings.general.dividerType);
        break;
      case Strings.shortText:
        child = TextInput(
          borderColor: CustomColors.grey,
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          hasError: controller.hasTextError.value,
          icon: null,
          keyboardType: getInputType(
              datas.panels[iPanel].fields[indexwidget].settings.validation.contentRule),
          onChanged: controller.onTextChanged,
          bOptional: datas.panels[iPanel].fields[indexwidget].settings.validation.fieldRule ==
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
            keyboardType: getInputType(
                datas.panels[iPanel].fields[indexwidget].settings.validation.contentRule),
            onChanged: controller.onNumberChanged,
            bOptional: datas.panels[iPanel].fields[indexwidget].settings.validation.fieldRule ==
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
          keyboardType: getInputType(
              datas.panels[iPanel].fields[indexwidget].settings.validation.contentRule),
          onChanged: controller.onNumberChanged,
          bOptional: datas.panels[iPanel].fields[indexwidget].settings.validation.fieldRule ==
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
          bOptional: datas.panels[iPanel].fields[indexwidget].settings.validation.fieldRule ==
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
            placeholder: datas.panels[iPanel].fields[indexwidget].settings.general.placeholder);
        break;
      case Strings.dateTime:
        child = DateInput(
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          isDisabled: true,
          onChanged: (value) => controller.onDateChanged,
          placeholder: datas.panels[iPanel].fields[indexwidget].settings.general.placeholder,
        );
        break;

      case Strings.time:
        child = TimeInput(
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          isDisabled: true,
          onChanged: (value) => controller.onDateChanged,
          placeholder: datas.panels[iPanel].fields[indexwidget].settings.general.placeholder,
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
            options: datas.panels[iPanel].fields[indexwidget].settings.specific.customOptions
                .toString()
                .split(','),
            slabel: datas.panels[iPanel].fields[indexwidget].label,
            bOptional: datas.panels[iPanel].fields[indexwidget].settingsvalidation.fieldRule !=
                Strings.required,
            onChanged: (value) => controller.onFormFieldChanged(
                  value.join(','),
                  datas.panels[iPanel].fields[indexwidget].label,
                ));
        break;
      case Strings.table:
        child = BottomUpTable();
        break;

      default:
        child = Container(
            child: Labels(
                sLabel: widgetType + ' ' + datas.panels[iPanel].fields[indexwidget].label,
                bRequired: false));
        break;
    }
    return child;
  }

  Widget DropdownOptions(int iPanel, int indexwidget) {
    child = Container();

    if (datas.panels[iPanel].fields[indexwidget].settings.specific.optionsType == Strings.custom) {
      child = DropDownMain(
        borderColor: CustomColors.grey,
        initialValue: '',
        label: datas.panels[iPanel].fields[indexwidget].label,
        sColumnName: datas.panels[iPanel].fields[indexwidget].id,
        hasError: controller.hasNumberError.value,
        icon: null,
        keyboardType:
            getInputType(datas.panels[iPanel].fields[indexwidget].settings.validation.contentRule),
        onChanged: controller.onNumberChanged,
        bOptional: datas.panels[iPanel].fields[indexwidget].settings.validation.fieldRule ==
            Strings.required,
        placeholder: '',
        sInputs: datas.panels[iPanel].fields[indexwidget].settings.specific.customOptions,
        sInputSeperator:
            datas.panels[iPanel].fields[indexwidget].settings.specific.separateOptionsUsing,
        sDropDownType: datas.panels[iPanel].fields[indexwidget].settings.specific.optionsType,
      );
    }

    if (datas.panels[iPanel].fields[indexwidget].settings.specific.optionsType ==
            Strings.existing &&
        !datas.panels[iPanel].fields[indexwidget].settings.specific.allowToAddNewOptions) {
      controller.getDropDownValues(controller.sFormId, datas.panels[iPanel].fields[indexwidget].id,
          iPanel, indexwidget, false);
      child = DropDownMainAPI(
          borderColor: CustomColors.grey,
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          sColumnName: datas.panels[iPanel].fields[indexwidget].id,
          hasError: controller.hasNumberError.value,
          icon: null,
          keyboardType: datas.panels[iPanel].fields[indexwidget].settings.validation.contentRule,
          onChanged: controller.onNumberChanged,
          bOptional: datas.panels[iPanel].fields[indexwidget].settings.validation.fieldRule ==
              Strings.required,
          placeholder: '',
          sInputs: controller.datadropString,
          sInputSeperator:
              datas.panels[iPanel].fields[indexwidget].settings.specific.separateOptionsUsing,
          sDropDownType: datas.panels[iPanel].fields[indexwidget].settings.specific.optionsType);
    }

    if (datas.panels[iPanel].fields[indexwidget].settings.specific.optionsType ==
            Strings.existing &&
        datas.panels[iPanel].fields[indexwidget].settings.specific.allowToAddNewOptions) {
      child = DropDownMainAPI(
          borderColor: CustomColors.grey,
          initialValue: '',
          label: datas.panels[iPanel].fields[indexwidget].label,
          sColumnName: datas.panels[iPanel].fields[indexwidget].id,
          hasError: controller.hasNumberError.value,
          icon: null,
          keyboardType: getInputType(
              datas.panels[iPanel].fields[indexwidget].settings.validation.contentRule),
          onChanged: controller.onNumberChanged,
          bOptional: datas.panels[iPanel].fields[indexwidget].settings.validation.fieldRule ==
              Strings.required,
          placeholder: '',
          sInputs: controller.datadropString,
          sInputSeperator:
              datas.panels[iPanel].fields[indexwidget].settings.specific.separateOptionsUsing,
          sDropDownType: datas.panels[iPanel].fields[indexwidget].settings.specific.optionsType);
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

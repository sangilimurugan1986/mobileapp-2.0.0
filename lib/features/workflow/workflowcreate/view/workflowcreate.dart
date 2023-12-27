import 'dart:ffi';

import 'package:ez/core/CustomColors.dart';
import 'package:ez/core/snackbar/snack_bar.dart';
import 'package:ez/features/workflow/model/Field.dart';
import 'package:ez/models/popup/form/components/check_box_input.dart';
import 'package:ez/models/popup/form/components/date_input.dart';
import 'package:ez/models/popup/form/components/datetime_input.dart';
import 'package:ez/models/popup/form/components/time_input.dart';
import 'package:ez/models/popup/form/controllers/panel_controller.dart';
import 'package:ez/routes.dart';
import 'package:ez/widgets/AlertDialogScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/CustomAppBar.dart';
import '../../../../core/utils/strings.dart';
import '../../../../models/popup/form/components/bottomup_table.dart';
import '../../../../models/popup/form/components/divider.dart';
import '../../../../models/popup/form/components/dropdown_main.dart';
import '../../../../models/popup/form/components/dropdown_main_api.dart';
import '../../../../models/popup/form/components/labels.dart';
import '../../../../models/popup/form/components/number_increment.dart';
import '../../../../models/popup/form/components/text_input.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class WorkflowCreate extends StatefulWidget {
  dynamic? datas = [];
  bool isEdit = false;
  final List<Map<String, dynamic>>? datas_onEdit;

  WorkflowCreate(
      {required this.datas, required this.isEdit, this.datas_onEdit});

  @override
  State<WorkflowCreate> createState() => _WorkflowCreateState();
}

class _WorkflowCreateState extends State<WorkflowCreate> {
  final controller = Get.put(PanelController());
  List<Map<String, dynamic>>? form_field_Values = [];
  Widget child = Container();
  String dateValue = "";
  String timeValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        actions: [
          AppBarAction(
              icon: Icon(Icons.done),
              onPressed: () => {
                    if (form_field_Values?.length == 0)
                      {
                        Snack.errorSnack(
                            context, Strings.alert_error_invalidform)
                      }
                    else
                      {
                        AppRoutes.pop(context, form_field_Values),
                      }
                  })
        ],
        backgroundColor: CustomColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: widget.datas.settings.specific.tableColumns.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8),
                        child: loadWidgets(
                            0,
                            index,
                            widget.datas.settings.specific.tableColumns[index],
                            widget.isEdit,
                            widget.datas_onEdit));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadWidgets(int iPanel, int indexwidget, var widgetData, bool isEdit,
      var datas_onEdit) {
    Widget child;
    final widgetType = widgetData.type;
    switch (widgetType) {
      case Strings.label:
        child = Container(
            child: Labels(
                sLabel: widget
                    .datas.settings.specific.tableColumns[indexwidget].label,
                bRequired: false));
        break;
      case Strings.divider:
        child = Dividers(
            sType: widget.datas.settings.specific.tableColumns[indexwidget]
                .settings.general.dividerType);
        break;
      case Strings.shortText:
        child = TextInput(
          borderColor: CustomColors.grey,
          initialValue:
              (isEdit) ? findValueUsingId(datas_onEdit, widgetData.id) : "",
          label: widget.datas.settings.specific.tableColumns[indexwidget].label,
          hasError: controller.hasTextError.value,
          icon: null,
          keyboardType: getInputType(widget.datas.settings.specific
              .tableColumns[indexwidget].settings.validation.contentRule),
          onChanged: (p0) {
            updateFormValues_WhileSubmit(
                widget.datas.settings.specific.tableColumns[indexwidget],
                p0,
                widget.datas.id);
          },
          bOptional: widget.datas.settings.specific.tableColumns[indexwidget]
                  .settings.validation.fieldRule ==
              Strings.required,
          placeholder: '',
        );
        break;
      case Strings.counter:
        child = NumberInput(
            borderColor: CustomColors.grey,
            initialValue:
                (isEdit) ? findValueUsingId(datas_onEdit, widgetData.id) : "",
            label:
                widget.datas.settings.specific.tableColumns[indexwidget].label,
            hasError: controller.hasNumberError.value,
            icon: null,
            keyboardType: getInputType(widget.datas.settings.specific
                .tableColumns[indexwidget].settings.validation.contentRule),
            onChanged: (p0) {
              updateFormValues_WhileSubmit(
                  widget.datas.settings.specific.tableColumns[indexwidget], p0);
            },
            bOptional: widget.datas.settings.specific.tableColumns[indexwidget]
                    .settings.validation.fieldRule ==
                Strings.required,
            placeholder: '');
        break;
      case Strings.number: // 'NUMBER'
        child = TextInput(
          borderColor: CustomColors.grey,
          initialValue:
              (isEdit) ? findValueUsingId(datas_onEdit, widgetData.id) : "",
          label: widget.datas.settings.specific.tableColumns[indexwidget].label,
          hasError: controller.hasNumberError.value,
          icon: null,
          keyboardType: getInputType(widget.datas.settings.specific
              .tableColumns[indexwidget].settings.validation.contentRule),
          onChanged: (p0) {
            updateFormValues_WhileSubmit(
                widget.datas.settings.specific.tableColumns[indexwidget], p0);
          },
          bOptional: widget.datas.settings.specific.tableColumns[indexwidget]
                  .settings.validation.fieldRule ==
              Strings.required,
          placeholder: '',
        );
        break;
      case Strings.longText:
        child = TextInput(
          borderColor: CustomColors.grey,
          initialValue:
              (isEdit) ? findValueUsingId(datas_onEdit, widgetData.id) : "",
          label: widget.datas.settings.specific.tableColumns[indexwidget].label,
          hasError: controller.hasMultiLineError.value,
          icon: null,
          keyboardType: TextInputType.multiline,
          onChanged: (p0) {
            updateFormValues_WhileSubmit(
                widget.datas.settings.specific.tableColumns[indexwidget], p0);
          },
          bOptional: widget.datas.settings.specific.tableColumns[indexwidget]
                  .settings.validation.fieldRule ==
              Strings.required,
          placeholder: '',
          maxLines: 2,
        );
        break;

      //Date Time Components
      case Strings.date:
        child = DateTimeInput(
          initialValue:
              (isEdit) ? findValueUsingId(datas_onEdit, widgetData.id) : "",
          label: widget.datas.settings.specific.tableColumns[indexwidget].label,
          isDisabled: true,
          onChangedDate: (p0) {
            dateValue = p0;
            updateFormValues_WhileSubmit(
                widget.datas.settings.specific.tableColumns[indexwidget],
                (timeValue.isNotEmpty)
                    ? dateValue + "," + timeValue
                    : dateValue,
                widget.datas.id);
          },
          onChangedTime: (p0) {
            timeValue = p0;
            updateFormValues_WhileSubmit(
                widget.datas.settings.specific.tableColumns[indexwidget],
                (dateValue.isNotEmpty)
                    ? dateValue + "," + timeValue
                    : timeValue,
                widget.datas.id);
          },
          placeholder: widget.datas.settings.specific.tableColumns[indexwidget]
              .settings.general.placeholder,
        );
        break;
      case Strings.dateTime:
        child = DateInput(
          initialValue:
              (isEdit) ? findValueUsingId(datas_onEdit, widgetData.id) : "",
          label: widget.datas.settings.specific.tableColumns[indexwidget].label,
          isDisabled: true,
          onChanged: (value) => (p0) {
            updateFormValues_WhileSubmit(
                widget.datas.settings.specific.tableColumns[indexwidget], p0);
          },
          placeholder: widget.datas.settings.specific.tableColumns[indexwidget]
              .settings.general.placeholder,
        );
        break;
      case Strings.time:
        child = TimeInput(
          initialValue:
              (isEdit) ? findValueUsingId(datas_onEdit, widgetData.id) : "",
          label: widget.datas.settings.specific.tableColumns[indexwidget].label,
          isDisabled: true,
          onChanged: (value) => (p0) {
            updateFormValues_WhileSubmit(
                widget.datas.settings.specific.tableColumns[indexwidget], p0);
          },
          placeholder: widget.datas.settings.specific.tableColumns[indexwidget]
              .settings.general.placeholder,
        );
        break;
      // Option - DropDown
      case Strings.singleSelect:
        child = DropdownOptions(iPanel, indexwidget);
        break;
      case Strings.multipleSelect:
        child = CheckBoxInput(
            initialValue:
                (isEdit) ? findValueUsingId(datas_onEdit, widgetData.id) : "",
            //controller.formFieldsModel[field.name],
            isDisabled: false,
            // controller.activeTab != 'Inbox',
            options: widget.datas.settings.specific.tableColumns[indexwidget]
                .settings.specific.customOptions
                .toString()
                .split(','),
            slabel:
                widget.datas.settings.specific.tableColumns[indexwidget].label,
            bOptional: widget.datas.settings.specific.tableColumns[indexwidget]
                    .settingsvalidation.fieldRule !=
                Strings.required,
            onChanged: (value) => controller.onFormFieldChanged(
                  value.join(','),
                  widget
                      .datas.settings.specific.tableColumns[indexwidget].label,
                ));
        break;
      case Strings.table:
        child = BottomUpTable();
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
                    widget.datas.settings.specific.tableColumns[indexwidget]
                        .label,
                bRequired: false));
        break;
    }
    return child;
  }

  Widget DropdownOptions(int iPanel, int indexwidget) {
    child = Container();

    if (widget.datas.settings.specific.tableColumns[indexwidget].settings
            .specific.optionsType ==
        Strings.custom) {
      child = DropDownMain(
        borderColor: CustomColors.grey,
        initialValue: '',
        label: widget.datas.settings.specific.tableColumns[indexwidget].label,
        sColumnName:
            widget.datas.settings.specific.tableColumns[indexwidget].id,
        hasError: controller.hasNumberError.value,
        icon: null,
        keyboardType: getInputType(widget.datas.settings.specific
            .tableColumns[indexwidget].settings.validation.contentRule),
        onChanged: controller.onNumberChanged,
        bOptional: widget.datas.settings.specific.tableColumns[indexwidget]
                .settings.validation.fieldRule ==
            Strings.required,
        placeholder: '',
        sInputs: widget.datas.settings.specific.tableColumns[indexwidget]
            .settings.specific.customOptions,
        sInputSeperator: widget.datas.settings.specific
            .tableColumns[indexwidget].settings.specific.separateOptionsUsing,
        sDropDownType: widget.datas.settings.specific.tableColumns[indexwidget]
            .settings.specific.optionsType,
      );
    }

    if (widget.datas.settings.specific.tableColumns[indexwidget].settings
                .specific.optionsType ==
            Strings.existing &&
        !widget.datas.settings.specific.tableColumns[indexwidget].settings
            .specific.allowToAddNewOptions) {
      controller.getDropDownValues(
          controller.sFormId,
          widget.datas.settings.specific.tableColumns[indexwidget].id,
          iPanel,
          indexwidget,
          false);
      child = DropDownMainAPI(
          borderColor: CustomColors.grey,
          initialValue: '',
          label: widget.datas.settings.specific.tableColumns[indexwidget].label,
          sColumnName:
              widget.datas.settings.specific.tableColumns[indexwidget].id,
          hasError: controller.hasNumberError.value,
          icon: null,
          keyboardType: widget.datas.settings.specific.tableColumns[indexwidget]
              .settings.validation.contentRule,
          onChanged: controller.onNumberChanged,
          bOptional: widget.datas.settings.specific.tableColumns[indexwidget]
                  .settings.validation.fieldRule ==
              Strings.required,
          placeholder: '',
          sInputs: controller.datadropString,
          sInputSeperator: widget.datas.settings.specific
              .tableColumns[indexwidget].settings.specific.separateOptionsUsing,
          sDropDownType: widget.datas.settings.specific
              .tableColumns[indexwidget].settings.specific.optionsType);
    }

    if (widget.datas.settings.specific.tableColumns[indexwidget].settings
                .specific.optionsType ==
            Strings.existing &&
        widget.datas.settings.specific.tableColumns[indexwidget].settings
            .specific.allowToAddNewOptions) {
      child = DropDownMainAPI(
          borderColor: CustomColors.grey,
          initialValue: '',
          label: widget.datas.settings.specific.tableColumns[indexwidget].label,
          sColumnName:
              widget.datas.settings.specific.tableColumns[indexwidget].id,
          hasError: controller.hasNumberError.value,
          icon: null,
          keyboardType: getInputType(widget.datas.settings.specific
              .tableColumns[indexwidget].settings.validation.contentRule),
          onChanged: controller.onNumberChanged,
          bOptional: widget.datas.settings.specific.tableColumns[indexwidget]
                  .settings.validation.fieldRule ==
              Strings.required,
          placeholder: '',
          sInputs: controller.datadropString,
          sInputSeperator: widget.datas.settings.specific
              .tableColumns[indexwidget].settings.specific.separateOptionsUsing,
          sDropDownType: widget.datas.settings.specific
              .tableColumns[indexwidget].settings.specific.optionsType);
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

  Future<void> updateFormValues_WhileSubmit(
      [var data, var input, final parentId]) async {
    if (widget.isEdit && form_field_Values!.isEmpty) {
      // This executes only when form_field_Values are empty while editing. Hence i am copying values from datas_onEdit
      form_field_Values = widget.datas_onEdit;
    }

    int? index = form_field_Values?.indexWhere((f) => f['id'] == data.id);
    if (index! >= 0) {
      // update the value

      form_field_Values?.removeAt(index);
    }
    // add the value
    form_field_Values?.add({
      "id": data.id,
      "label": data.label,
      "type": data.type,
      "value": input,
      "parentid": parentId,
    });
  }

  String findValueUsingId(final datas_onEdit, final id) {
    final index = datas_onEdit.indexWhere((f) => f['id'] == id);
    final result = (index >= 0) ? datas_onEdit[index]['value'] : '';
    return result;
  }

  @override
  void dispose() {
    // controller.dispose();
    // form_field_Values?.clear();
    super.dispose();
  }
}

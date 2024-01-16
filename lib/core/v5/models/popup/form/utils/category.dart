import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/Labels.dart';
import '../components/check_box_input.dart';
import '../components/date_input.dart';
import '../components/datetime_input.dart';
import '../components/divider.dart';
import '../components/dropdown_main.dart';
import '../components/dropdown_main_api.dart';
import '../components/formbutton.dart';
import '../components/number_increment.dart';
import '../components/radio_button_input.dart';
import '../components/text_input.dart';
import '../components/time_input.dart';
import '../controllers/panel_controller.dart';

class Category {
  Map datas = Map<String, dynamic>();
  Widget child = Container();
  final controller = Get.put(PanelController());
  String sFormId = '3042';

  static List<Widget> getWidget(Map<dynamic, dynamic> data) {
    List<Widget> list = [];
    try {
      Map<dynamic, dynamic> datas = json.decode(data['formJson']);
      for (int i = 0; i < datas['panels'].length; i++) {
        list.add(Container(
            // color: Color(0xFFcbd5e1),
            padding: EdgeInsets.all(10),
            child: Text(
              datas['panels'][i]['settings']['title'].toString(),
              /*style: const TextStyle(
                    color: Color(0xFF643094), fontSize: 16, fontWeight: FontWeight.bold)*/
            )));
      }
    } catch (e, _) {
      debugPrint(e.toString());
    }
    return list;
  }

  List<Widget> getContentList(Map<dynamic, dynamic> data, BuildContext context) {
    // final controller = Get.put(PanelController());
    List<Widget> list = [];
    try {
      datas = json.decode(data['formJson']);
      for (int i = 0; i < datas['panels'].length; i++) {
        list.add(Container(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: datas['panels'][i]['fields'].length + 1,
            itemBuilder: (BuildContext context, int indexwidget) {
              return Container(
                  color: Colors.yellow,
                  child: Column(
                    //physics: NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        height: 15,
                        color: Colors.red,
                        padding: EdgeInsets.all(2),
                      ),
                      indexwidget != datas['panels'][i]['fields'].length
                          ? loadWidgets(i, indexwidget,
                              datas['panels'][i]['fields'][indexwidget]['type'], datas)
                          : Container(),
                    ],
                  ));
            },
          ),
        ));
      }
    } catch (e, _) {
      debugPrint(e.toString());
    }
    return list;
  }

  Widget loadWidgets(int iPanel, int indexwidget, String widgetType, Map<dynamic, dynamic> datas) {
    print(indexwidget);
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
      case 'NUMBER':
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
      case 'INCREMENT COUNTER': // 'NUMBER'
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
      case 'SINGLE_CHOICE':
        child = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Labels(
                sLabel: widgetType + ' ' + datas['panels'][iPanel]['fields'][indexwidget]['label'],
                bRequired: false),
            RadioButtonInput(
              initialValue: datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']
                      ['customOptions']
                  .toString()
                  .split(',')[0],
              isDisabled: false,
              options: datas['panels'][iPanel]['fields'][indexwidget]['settings']['specific']
                      ['customOptions']
                  .toString()
                  .split(','),
              onChanged: (value) => controller.onFormFieldChanged(value, controller.Initial),
            )
          ],
        );
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
      controller.getDropDownValues(sFormId, datas['panels'][iPanel]['fields'][indexwidget]['id'],
          iPanel, indexwidget, false);
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

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ez/config/theme.dart';
import 'package:ez/models/popup/form/utils/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../../api/auth_repo.dart';
import '../../../utils/helper/aes_encryption.dart';
import '../../../utils/helper/safe_area.dart';
import '../controllers/popupfullpagecontroller.dart';
import 'components/Labels.dart';

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
import 'package:dio/dio.dart';
import 'dart:convert';

class FormMainTab extends StatefulWidget {
  Map formdatas = Map<dynamic, dynamic>();
  FormMainTab({Key? key, required this.formdatas}) : super(key: key);

  FormMainTabState createState() => FormMainTabState();
}

class FormMainTabState extends State<FormMainTab> with TickerProviderStateMixin {
  final isLoading = false.obs;
  final error = ''.obs;
  Widget child = Container();
  Map mdataGenerate = Map<String, dynamic>();
  Map datas = Map<String, dynamic>();
  Map datastest = Map<String, dynamic>();
  final controller = Get.put(PanelController());
  final controllerpopup = Get.put(PopupFullPageController());

  // String sFormId = '3042'; //3061-card 23  27s 3065 4071-CLASSIC 3042-card 3043 -card

  late TabController myTabController;

  @override
  void initState() {
    super.initState();
    //datas=widget.datas;
    mdataGenerate = widget.formdatas;
    datastest = controllerpopup.mFormJSon;
    datas = widget.formdatas['formJson'];
    datas = json.decode(widget.formdatas['formJson']);
    Category.getWidget(datas);
    //getComponentDetails(sFormId); //3061 23  27s 3065
  }

  Future getComponentDetails(String formId) async {
    isLoading.value = true;

    error.value = '';
    try {
      final response = await AuthRepo.getInboxSingleDetails(formId); //23 formids

      Map<String, dynamic> data = jsonDecode(AaaEncryption.decryptAESaaa(response.data));
      setState(() {
        isLoading.value = false;
        mdataGenerate = data;
        datas = json.decode(data['formJson']);
        myTabController = new TabController(
            vsync: this, length: Category.getWidget(mdataGenerate).length, initialIndex: 0);
      });

      setState(() {
        isLoading.value = false;
        Category.getWidget(data);
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
    final safeArea = calcSafeArea();
    double safeAreaHeight = safeArea['height']!;

    // TODO: implement build
    return isLoading.isFalse
        ? Scaffold(
            body: Container(
            color: Color.fromRGBO(240, 245, 249, 1), //rgb(240 245 249)
            // margin: EdgeInsets.all(5),
            child: ListView(physics: NeverScrollableScrollPhysics(), shrinkWrap: true, children: <
                Widget>[
              Container(
                  height: safeAreaHeight,
                  color: Colors.red,
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      title: Container(
                          // color: Colors.yellow,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Textbold(sLabel: mdataGenerate['name'].toString()),
                        mdataGenerate['description'].toString().length > 0
                            ? TextNormal(sLabel: mdataGenerate['description'].toString())
                            : Container(),
                      ])),
                      bottom: PreferredSize(
                        preferredSize: TabBar(
                          controller: myTabController,
                          tabs: Category.getWidget(mdataGenerate),
                        ).preferredSize,
                        child: Material(
                            color: Color(0xFFcbd5e1),
                            child: Theme(
                                //<-- SEE HERE
                                data: ThemeData().copyWith(splashColor: Colors.white),
                                child: TabBar(
                                  indicatorColor: Colors.transparent,
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Color(0xff64748b),
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  unselectedLabelStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  indicator: BoxDecoration(
                                      color: BrandColors.primary,
                                      borderRadius:
                                          BorderRadius.only(topRight: Radius.circular(15.0))),
                                  isScrollable: true,
                                  controller: myTabController,
                                  tabs: Category.getWidget(mdataGenerate),
                                ))),
                      ),
                    ),
                    body: TabBarView(
                      controller: myTabController,
                      children: new Category().getContentList(mdataGenerate, context),
                    ),
                  ))
            ]),
          ))
        : Container(
            height: 200,
            color: Colors.white,
            alignment: Alignment.center,
            child: DefaultTextStyle(
                style: TextStyle(decoration: TextDecoration.none),
                child: Text('Loading...',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))));
  }

  Widget loadWidgets(int iPanel, int indexwidget, String widgetType) {
    print(datas['panels'][iPanel]['fields'][indexwidget]['label'] + " ==  " + widgetType);
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
      controller.getDropDownValues(controllerpopup.sFormId,
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

/*  void loadvaliurofItems() {
    var items = [''];
    switch (widget.sInputSeperator) {
      case 'NEWLINE':
        items = widget.sInput.split('\n');
        break;
      case 'COMMA':
        items = widget.sInput.split(',');
        break;
    }
  }*/

  justprint() {}
}

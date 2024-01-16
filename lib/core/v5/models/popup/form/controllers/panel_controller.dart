import 'package:get/get.dart';

import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../api/taskform_repo.dart';
import '../../../../utils/helper/aes_encryption.dart';
import '../modals/ticket_form_field.dart';

class PanelController extends GetxController {
  // final sessionController = Get.find<SessionController>();

  final bPanelVisible = true.obs;

  final email = ''.obs;
  final hasEmailError = false.obs;

  final password = ''.obs;
  final hasPasswordError = false.obs;

  final number = ''.obs;
  final hasNumberError = false.obs;

  final text = ''.obs;
  final hasTextError = false.obs;

  final multiline = ''.obs;
  final hasMultiLineError = false.obs;

  final date = ''.obs;
  final hasDateError = false.obs;

  final time = ''.obs;
  final hasTimeError = false.obs;

  final dateandtime_date = ''.obs;
  final hasdateandtime_DateError = false.obs;

  final dateandtime_time = ''.obs;
  final hasdateandtime_TimeError = false.obs;

  final isLoading = false.obs;
  final error = ''.obs;

  final List<dynamic> datadrop = List.empty().obs;

  List<String> datadropString = <String>[].obs;
  List<String> temp = <String>[].obs;
  //final datadropString=[].obs;//

  final formFields = <TicketFormField>[].obs;
  final formFieldsModel = <String, dynamic>{}.obs;

  int itabselected = 0;
  String Initial = 'YES';
  String sFormId = '';
  String repositoryId = '';
  List<String> formbuttonList = <String>[].obs;
  List<dynamic> userGroupList = <dynamic>[].obs;
  List<dynamic> blockId = <dynamic>[].obs;

  /// dynamic list

  @override
  Future onInit() async {}
  // onEmailChanged
  void onEmailChanged(String value) {
    email.value = value;
  }

  Future login() async {
    isLoading.value = true;
    error.value = '';
  }

  // ...
  // onPasswordChanged
  void onPasswordChanged(String value) {
    password.value = value;
  }

  //  // onNumberChange
  void onNumberChanged(String value) {
    number.value = value;
  }

  //  // ontextChange
  void onTextChanged(String value) {
    text.value = value;
  }

  //  // onMultilineChange
  void onMultilineChanged(String value) {
    multiline.value = value;
  }

  //  // onMultilineChange
  void onDateChanged(String value) {
    date.value = value;
  }

  void onTimeChanged(String value) {
    time.value = value;
    print(date.value);
  }

  //dateandtime_

  void ondateandtime_DateChanged(String value) {
    dateandtime_date.value = value;
  }

  void ondateandtime_TimeChanged(String value) {
    dateandtime_time.value = value;
  }

  // on form field changed

  void onFormFieldChanged(dynamic value, String fieldName) {
    formFieldsModel[fieldName] = value;
  }

  // ...
  // reset

  void reset() {
    email.value = '';
    password.value = '';
    hasEmailError.value = false;
    hasPasswordError.value = false;
    isLoading.value = false;
    error.value = '';
  }

  Future<List<String>> getDropDownValues(
      String sFormId, String columnId, int iPanel, int indexwidget, bool bTextField) async {
    try {
      // columnId = 'JghKAtOm3pRdVcOJp0bZt';
      var temp;
      final payload = {'column': columnId, 'keyword': '', 'rowFrom': 0, 'rowTo': 0};

      final response = await TaskFormRepo.getDropDownValues(
          sFormId, jsonEncode(AaaEncryption.EncryptDatatest(jsonEncode(payload)))); //23 formid
      temp = jsonDecode(AaaEncryption.decryptAESaaa(response.data)) as List<dynamic>;
      // setState(() {
      if (temp.length > 0) {
        //temp.clear();
        datadropString.clear();
        // For show Textfield
        if (bTextField) {
          datadropString.add(''); //tbx152015
        }
        // add data from api call
        for (int i = 0; i < temp.length; i++) {
          datadropString.add(temp[i].toString());
        }
        //datadropString = temp;
        // final data = jsonDecode(response.body);
        return List<String>.from(datadropString);
      }

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to load data from API 1');
        throw 'invalid status code';
      }
    } on DioError catch (e) {
      throw Exception('Failed to load data from API 1');
    } catch (e) {
      print(e);
      throw Exception('Failed to load data from API 1');
    } finally {
      throw Exception('Failed to load data from API 2');
    }
  }
}

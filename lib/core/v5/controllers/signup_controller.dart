import 'package:dio/dio.dart';

import 'package:get/get.dart';

class SignUpController extends GetxController {
  final email = ''.obs;
  final hasEmailError = false.obs;

  final fullname = ''.obs;
  final hasFullNameError = false.obs;

  final password = ''.obs;
  final hasPasswordError = false.obs;

  final confirmpassword = ''.obs;
  final hasconfirmPasswordError = false.obs;

  final isLoading = false.obs;
  final error = ''.obs;

  @override
  Future onInit() async {
    super.onInit();
  }

  // onEmailChanged
  void onEmailChanged(String value) {
    email.value = value;
  }

  // onEmailChanged
  void onFullNameChanged(String value) {
    fullname.value = value;
  }

  // ...
  // onPasswordChanged
  void onPasswordChanged(String value) {
    password.value = value;
  }

  void onConfirmPasswordChanged(String value) {
    confirmpassword.value = value;
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

  // ...
  // login

  Future login() async {
    hasEmailError.value = email.value == '';
    hasPasswordError.value = password.value == '';
    if (hasEmailError.value || hasPasswordError.value) {
      return;
    }
    isLoading.value = true;
    error.value = '';
/*    final payload = {
      'email': email.value,
      'password': password.value,
      'apiPath': sessionController.apiUrl.value,
    };

    try {
      final response = await AuthRepo.login(payload);

      final statusCode = response.statusCode;
      final Map<String, dynamic> data = response.data;

      if (statusCode == 200) {
        reset();
        sessionController.setSession(data);
        Get.offAllNamed('/browse');
      } else {
        throw 'invalid status code';
      }
    } on DioError catch (e) {
      final statusCode = e.response?.statusCode;

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
    }finally {
      isLoading.value = false;
    }*/
  }

  // ...
}

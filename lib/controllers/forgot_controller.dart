import 'package:dio/dio.dart';

import 'package:get/get.dart';

class ForgotController extends GetxController {
  final email = ''.obs;
  final hasEmailError = false.obs;

  final password = ''.obs;
  final hasPasswordError = false.obs;

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

  // ...
  // onPasswordChanged
  void onPasswordChanged(String value) {
    password.value = value;
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
  }

  // ...
}

import 'package:dio/dio.dart';

import 'package:get/get.dart';

import '../controllers/session_controller.dart';
import '../utils/helper/aes_encryption.dart';
import 'package:http/http.dart' as http;

class Api extends GetxController {
  final controller = Get.find<SessionController>();

  Dio client() {
    return Dio(
      //BaseOptions(baseUrl: 'http://52.172.32.88/eZenterpriseAPI/api'),
      BaseOptions(
          baseUrl: 'http://52.172.32.88/CoreAPI/api/',
          headers: {"Accept": "application/json;text/html"}),
    );
  }

  clientLogin(String sUserEmail) {
    return Dio(
      BaseOptions(baseUrl: 'http://52.172.32.88/CoreAPI/api/', headers: {
        "Accept": "application/json;text/html",
        "Token": 'email ' + sUserEmail,
        "Content-Type": "application/json"
      }),
    );
  }

  Dio clientWithHeader() {
    var dtemp = Dio(BaseOptions(
        // baseUrl: 'http://52.172.32.88/eZenterpriseAPI/api/',
        baseUrl: 'http://52.172.32.88/CoreAPI/api/',
        headers: {
          "Accept": "application/json;text/html",
          "Token": AaaEncryption.sToken,
          "Content-Type": "application/json",
        }));

    return dtemp;
  }

  Dio clientWithHeaderFile() {
    var dtemp = Dio(BaseOptions(
        // baseUrl: 'http://52.172.32.88/eZenterpriseAPI/api/',
        baseUrl: 'http://52.172.32.88/CoreAPI/api/',
        headers: {
          "Accept": "*/*",
          "Token": AaaEncryption.sToken,
          "Content-Type": "multipart/form-data",
        }));

    return dtemp;
  }
}

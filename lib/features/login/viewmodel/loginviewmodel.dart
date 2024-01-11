import 'dart:convert';

import 'package:ez/core/ApiClient/endpoint.dart';
import 'package:ez/core/utils/strings.dart';
import 'package:ez/features/login/model/login_response.dart';
import 'package:ez/features/login/repository/loginrepo.dart';
import 'package:ez/utils/helper/aes_encryption.dart';
import 'package:flutter/widgets.dart';

class LoginViewModel extends ChangeNotifier {
  late final LoginReposity repo;

  LoginViewModel(this.repo);

  LoginResponse data = LoginResponse();
  bool loading = false;
  String errormessage = "";

  Future<void> validateCredentials(var _data) async {
    loading = true;
    errormessage = "";

    try {
      final encryptedData = await repo.validateCredentials(
          EndPoint.getPath(method: EndPoint.login), _data);
      String decryptedData = AaaEncryption.dec_base64(encryptedData);
      final decryptedJson = json.decode(decryptedData);
      data = LoginResponse.fromJson(decryptedJson);
    } catch (e) {
      errormessage = Strings.txt_error_fetchfailed;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}

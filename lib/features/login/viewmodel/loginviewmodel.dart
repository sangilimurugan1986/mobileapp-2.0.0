import 'dart:convert';

import 'package:ez/core/ApiClient/endpoint.dart';
import 'package:ez/core/utils/strings.dart';
import 'package:ez/features/login/model/login_response.dart';
import 'package:ez/features/login/repository/loginrepo.dart';
import 'package:ez/utils/helper/aes_encryption.dart';
import 'package:flutter/widgets.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/auth_repo.dart';
import '../../../controllers/session_controller.dart';

class LoginViewModel extends ChangeNotifier {
  late final LoginReposity repo;

  LoginViewModel(this.repo);

  LoginResponse data = LoginResponse();
  bool loading = false;
  String errormessage = "";
  final sessionController = Get.find<SessionController>();

  Future<void> validateCredentials(var _data) async {
    loading = true;
    errormessage = "";

    try {
      final encryptedData =
          await repo.validateCredentials(EndPoint.BaseUrl + EndPoint.login, _data);
      String decryptedData = AaaEncryption.dec_base64(encryptedData);
      final decryptedJson = json.decode(decryptedData);
      data = LoginResponse.fromJson(decryptedJson);

      //Assign Values
      AaaEncryption.sToken = data.token.toString();
      AaaEncryption.IvVal = enc.IV.fromBase64(data.iv.toString());
      AaaEncryption.KeyVal = enc.Key.fromBase64(data.key.toString());

      //get user details and save in session & shared pref
      if (AaaEncryption.sToken.toString().length > 10) {
        final encryptedData = await repo.userDataCredentials(
            EndPoint.BaseUrl + EndPoint.getuserDetails, AaaEncryption.sToken);

        Map<String, dynamic> data = jsonDecode(AaaEncryption.decryptAESaaa(encryptedData));

        SharedPreferences pre = await SharedPreferences.getInstance();
        pre.setString('Userdata', encryptedData.toString());
        pre.setString('userid', data['id'].toString());
        pre.commit();
        sessionController.setSessionuser(data);

        pre.setString('userid', data['id']);
        pre.setString('username', data['firstName'] + " " + data['lastName']);
        pre.setString('email', data['email']);
        pre.setString('avatar', data['avatar']);
        pre.commit();
      }
    } catch (e) {
      errormessage = Strings.txt_error_fetchfailed;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}

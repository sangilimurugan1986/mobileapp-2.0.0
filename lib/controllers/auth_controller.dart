import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ez/controllers/session_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/helper/aes_encryption.dart';
import '../utils/utils.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as enc;

class AuthController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? connectivitySubscription;
  var isConnected = true.obs;
  var token = "".obs;
  var route = "".obs;
  Map<String, dynamic> userdata = {};

  @override
  void onInit() {
    super.onInit();
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) async {
      await getConnectivity();
    });
    route.value = "";
  }

  @override
  void onReady() {
    super.onReady();
    getConnectivity();
  }

  @override
  void dispose() {
    connectivitySubscription?.cancel();
    super.dispose();
  }

  Future<void> getConnectivity() async {
    try {
      bool isConnectedResult = await Utils.checkInternetConnectivity();
      isConnected.value = isConnectedResult;
      Future.delayed(Duration(milliseconds: 3000), () {
        getUserInfoAndRedirect();
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
    return Future.value(null);
  }

  Future<void> getUserInfoAndRedirect() async {
    try {
      if (!isConnected.value)
        Get.offAndToNamed("/noConnection");
      else {
        // check local login saved detail
        readlocalData();
      }
    } on Exception catch (e) {
      print('${e.toString()}');
    }
  }

  readlocalData() async {
    AaaEncryption.sToken = '';
    SharedPreferences pre = await SharedPreferences.getInstance();
    AaaEncryption.KeyVal = enc.Key.fromBase64(pre.getString('key').toString());
    AaaEncryption.IvVal = enc.IV.fromBase64(pre.getString('iv').toString());
    AaaEncryption.sToken = pre.getString('token').toString();

    if (AaaEncryption.sToken.length > 4) {
      String ss = pre.getString('Userdata').toString();
      userdata = jsonDecode(AaaEncryption.decryptAESaaa(ss));
      pre.setString('userid', userdata['id']);
      pre.setString('username', userdata['firstName'] + " " + userdata['lastName']);
      pre.setString('email', userdata['email']);
      pre.commit();
      //sessionController.setSessionuser(data);
      final sessionController = Get.find<SessionController>();
      sessionController.setSessionuser(userdata);

      Get.offAndToNamed("/home");
    } else
      Get.offAndToNamed("/loginscreen");
  }

  Future<void> logout() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.clear();
    pre.commit();
    Get.offAllNamed("/loginscreen");
  }
}

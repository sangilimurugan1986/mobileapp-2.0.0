import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ez/core/v5/controllers/session_controller.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/helper/aes_encryption.dart';
import '../utils/utils.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:intl/intl_standalone.dart';

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
      Future.delayed(Duration.zero, () {
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
    final sessionController = Get.find<SessionController>();
    sessionController.getSession();
    Get.offAndToNamed("/loginscreen");
  }

  Future<void> logout() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.clear();
    pre.commit();
    Get.offAllNamed("/loginscreen");
  }
}

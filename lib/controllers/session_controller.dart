import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/session.dart';
import '../utils/UserDetails.dart';

class SessionController extends GetxController {
  final Userdata = UserDetails.empty().obs;

  final token = ''.obs;
  final key = ''.obs;
  final iv = ''.obs;
  final userid = 0.obs;
  final twoFactorAuthendication = ''.obs;
  final store = GetStorage();
  var userdata = '';

  @override
  Future onInit() async {
    await getSession();
    super.onInit();
  }

  // ...
  // initSession
  void initSession(Session session) {
    token.value = session.token;
    iv.value = session.iv;
    key.value = session.key;
    twoFactorAuthendication.value = session.twoFactorAuthentication;
  }

  void initUserDetails(UserDetails data) {
    userid.value = data.id;
  }

  // ...
  // setSession

  Future<void> setSession(Map<String, dynamic> data) async {
    try {
      final session = Session.fromJson(data);
      initSession(session);
      store.write('session', json.encode(session));
      store.save();
    } catch (e) {
      print(e);
    }
  }

  setSessionuser(Map<String, dynamic> data) async {
    try {
      Userdata.value = UserDetails.fromJson(data);

      store.write('userdetails', json.encode(data));
      //store.write('userdetails', json.encode(Userdata));
      store.save();

      final session = store.read('session') ?? '';
      userdata = store.read('userdetails') ?? '';
      final _session = Session.fromJson(json.decode(session));
    } catch (e) {
      print(e);
    }
  }

  // ...
  // getSession
  Future<void> getSession() async {
    try {
      final session = store.read('session') ?? '';
      final userdetailsdata = store.read('userdetails') ?? '';

      if (session != '') {
        final _session = Session.fromJson(json.decode(session));
        initSession(_session);
        // assign user details
        if (userdetailsdata != '') {
          Userdata.value = UserDetails.fromJson(userdetailsdata);
          initUserDetails(Userdata.value);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // deleet Session
  void deleteSession() {}
}

import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../config/global_config.dart';
import '../models/language.dart';
import '../utils/utils.dart';
import 'auth_controller.dart';

class LanguageController extends GetxController {
  final AuthController authController = Get.put(AuthController());
/*
  var language = "en".obs;
  var languages = <Language>[].obs;
  var languagesStore = <Language>[].obs;
  var activeLanguageId = 0.obs;
  var languageMap = <String, Map<String, String>>{}.obs;

  String get currentLanguage => language.value;
  int get currentLanguageId => activeLanguageId.value;*/

  @override
  void onInit() {
    super.onInit();
    //getLanguages();  235
  }

/*  Locale? get getLocale {
    if (currentLanguageStore.value == '') {
      language.value = DEFAULT_LANG;
      updateLanguage(DEFAULT_LANG);
    } else if (currentLanguageStore.value != '') {
      return Locale(currentLanguageStore.value);
    }
    return Get.deviceLocale;
  }

  RxString get currentLanguageStore {
    final store = GetStorage();
    language.value = store.read('language') ?? '';
    return language;
  }

  Future<void> updateLanguage(String value) async {
    final store = GetStorage();
    language.value = value;
    await store.write('language', value);
    if (getLocale != null) {
      Get.updateLocale(getLocale!);
    }
    update();
  }

  Future<void> getLanguages() async {}

  void onSearch(text) {
    List<Language> resultList = [];

    if (text.length > 0) {
      languages.forEach((element) {
        if (element.name!.toLowerCase().contains(text)) resultList.add(element);
      });

      languages.value = resultList;
    } else
      languages.value = languagesStore;

    languages.refresh();
  }

  void setLanguage(String locale, int id) {
    language.value = locale;
    activeLanguageId.value = id;
    updateLanguage(locale);

    Get.toNamed("/splash");
  }*/
}

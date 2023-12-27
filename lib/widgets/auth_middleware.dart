import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddleware extends GetMiddleware {
  final store = GetStorage();

/*  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final domain = store.read('domainmy') ?? '';
    print('lllllllllllllllll');
    print(route.currentPage?.name);
    if (route.currentPage?.name == '/') {
      print('//////////////////////////');

      if (domain.toString().length > 6) {
        return GetNavConfig.fromRoute('/browse');
      } else {
        return GetNavConfig.fromRoute('/searchResult');
      }
    }
    return GetNavConfig.fromRoute('/upload');
  }*/
}

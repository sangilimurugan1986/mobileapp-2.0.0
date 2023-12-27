import 'package:dio/dio.dart' as dio;

import 'package:get/get.dart';

import '../models/nodule.dart';
import '../models/repository.dart';
import '../models/repository_field.dart';

class RepositoryController extends GetxController {
  var nodules = <Nodule>[].obs;

  var repositories = <Repository>[].obs;
  final repositoryFields = <RepositoryField>[].obs;

/*
  // getNodules

  Future<Map<dynamic, dynamic>> getNodules(Map<String, dynamic> payload) async {
    final _payload = <String, dynamic>{
      'token': sessionController.token.value,
      ...payload,
    };

    try {
      final response = await RepositoryRepo.getNodules(_payload);

      final statusCode = response.statusCode;
      final data = response.data;

      if (statusCode == 200 && data != null) {
        return data;
      } else {
        throw 'error';
      }
    } catch (e) {
      alert(title: 'Error', subtitle: 'Error fetching data', type: 'Negative');
      print(e);
      return <dynamic, dynamic>{};
    }
  }
*/

}

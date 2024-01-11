import 'dart:developer';

import 'package:ez/core/ApiClient/ApiService.dart';
import 'package:ez/core/utils/strings.dart';
import 'package:ez/features/tasklist/repository/repository.dart';

class TaskListRepoImpl extends TaskListRepo {
  final ApiManager apiService;

  TaskListRepoImpl(this.apiService);

  @override
  Future<dynamic> getData(String path, var data) async {
    try {
      final _data = await apiService.postdata(path, data);
      return _data;
    } catch (e) {
      throw Exception(Strings.txt_error_fetchfailed);
    }
  }
}

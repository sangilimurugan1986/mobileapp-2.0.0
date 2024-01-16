import 'package:dio/dio.dart';

import 'api.dart';

class TaskFormRepo {
  const TaskFormRepo();

  static Future<Response> getDropDownValues(String sFormId, String payload) {
    return Api().clientWithHeader().post<dynamic>(
        'form/' + sFormId + '/' + 'uniqueColumnValues',
        data: payload);
  }
}

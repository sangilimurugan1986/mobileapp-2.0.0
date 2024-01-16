import 'dart:convert';

import 'package:dio/dio.dart';

import 'api.dart';

class FolderRepo {
  const FolderRepo();

  static Future<Response> getRepositoriesList(String payload) {
    return Api().clientWithHeader().post<dynamic>('/repository/all', data: jsonEncode(payload));
  }
}

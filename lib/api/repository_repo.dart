import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';

import 'api.dart';

class RepositoryRepo {
  const RepositoryRepo();

  static Future<Response<Map>> getNodules(Map<String, dynamic> payload) {
    return Api().client().post<Map>('/Mobile/getNodules', data: payload);
  }

  static Future<Response<List>> getRepositories(Map<String, dynamic> payload) {
    return Api().client().post<List>('/Mobile/getRepositories', data: payload);
  }

  static Future<Response<Map>> getRepositoryStats(Map<String, dynamic> payload) {
    return Api().client().post<Map>('/Mobile/getRepositoryStats', data: payload);
  }

  static Future<Response<List>> getRepositoryFields(Map<String, dynamic> payload) {
    return Api().client().post<List>('/Mobile/getRepositoryFields', data: payload);
  }

  static Future<Response<Map>> getRepositoryFieldOptions(Map<String, dynamic> payload) {
    return Api().client().post<Map>('/Mobile/getOptions', data: payload);
  }

  static Future<Response<Map>> searchRepository(Map<String, dynamic> payload) {
    return Api().client().post<Map>('/Mobile/searchRepository', data: payload);
  }

  static Future<Response<Map>> getFileProperties(Map<String, dynamic> payload) {
    return Api().client().post<Map>('/Mobile/ViewFileProperties', data: payload);
  }

  static Future<Response<Map>> getFieldValues(Map<String, dynamic> payload) {
    return Api().client().post<Map>('/Mobile/getFieldValues', data: payload);
  }

  static Future<Response<String>> uploadFile(
      FormData payload, void Function(int, int) uploadProgress) {
    return Api().client().post<String>(
          '/Mobile/uploadFile',
          data: payload,
          onSendProgress: uploadProgress,
        );
  }

  static Future<Response<Map>> getUploadedFiles(Map<String, dynamic> payload) {
    return Api().client().post<Map>('/Mobile/getUploadedFiles', data: payload);
  }

  static Future<Response<String>> saveFieldValues(Map<String, dynamic> payload) {
    return Api().client().post<String>('/Mobile/saveFieldValues', data: payload);
  }
}

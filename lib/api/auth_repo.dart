import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'api.dart';

class AuthRepo {
  const AuthRepo();

  static Future<Response> login(Map<String, String> payload, String sUserEmail) {
    return Api().clientLogin(sUserEmail).post<dynamic>('/authentication/login', data: payload);
  }

  static Future<Response> getUserDetails() {
    return Api().clientWithHeader().get<dynamic>('/authentication/userSession');
  }

  static Future<Response> getInboxListForFolder(String sWorkflowId, String payload, String sType) {
    switch (sType) {
      case '0':
        return Api()
            .clientWithHeader()
            .post<dynamic>('workflow/inboxList/' + sWorkflowId, data: payload);

      case '1':
        return Api()
            .clientWithHeader()
            .post<dynamic>('workflow/processList/' + sWorkflowId, data: payload);

      case '2':
        return Api()
            .clientWithHeader()
            .post<dynamic>('workflow/staredList/' + sWorkflowId, data: payload);

      case '3':
        return Api()
            .clientWithHeader()
            .post<dynamic>('workflow/completedList/' + sWorkflowId, data: payload);
    }

    return Api()
        .clientWithHeader()
        .post<dynamic>('workflow/inboxList/' + sWorkflowId, data: payload); //7  or 6
  }

  static Future<Response> getCommentsList(String sWorkflowId, String sFormEntryId) {
    return Api()
        .clientWithHeader()
        .get<dynamic>('workflow/comments/' + sWorkflowId + '/' + sFormEntryId); //7  or 6
  }

  static Future<Response> getFileList(String sWorkflowId, String sFormId) {
    return Api()
        .clientWithHeader()
        .get<dynamic>('workflow/attachmentList/' + sWorkflowId + '/' + sFormId); //7  or 6
  }

  static Future<Response> getHistoryList(String sWorkflowId, String sFormEntryId) {
    return Api()
        .clientWithHeader()
        .get<dynamic>('workflow/processHistory/' + sWorkflowId + '/' + sFormEntryId); //7  or 6
  }

  static Future<Response> getTaskList(String sWorkflowId, String sFormId, String payload) {
    return Api()
        .clientWithHeader()
        .post<dynamic>('workflow/taskList/' + sWorkflowId + '/' + sFormId, data: payload);
  }

  static Future<Response> postDeleteFiles(String sRepositoryId, String sFileId) {
    return Api()
        .clientWithHeader()
        .post<dynamic>('menu/file/delete/' + sRepositoryId + '/' + sFileId);
  }

  static Future<Response> getUserList(String payload) {
    return Api().clientWithHeader().post<dynamic>('user/list', data: payload);
  }

  static Future<Response> getInboxSingleDetails(String sInboxID) {
    return Api().clientWithHeader().get<dynamic>(
          'form/' + sInboxID,
        );
  }

  static Future<Response> postComments(
      String sWorkflowId, String sProcessId, String sTransactionId, String payload) {
    return Api().clientWithHeader().post<dynamic>(
        'workflow/comments/' + sWorkflowId + '/' + sProcessId + '/' + sTransactionId,
        data: payload);
  }

  static Future<Response> postAttachment(FormData payload) {
    return Api()
        .clientWithHeaderFile()
        .post<dynamic>('workflow/attachmentWithProcessId', data: payload);
  }

  static Future<Response> getTotalInboxCount() {
    return Api().clientWithHeader().get<dynamic>('workflow/myInboxCount');
  }
}

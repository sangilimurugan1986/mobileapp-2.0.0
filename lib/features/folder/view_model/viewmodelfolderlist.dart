import 'dart:async';
import 'dart:convert';
import 'package:ez/utils/helper/aes_encryption.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import '../repository/repository.dart';

class FolderListViewModel extends ChangeNotifier {
  final FolderListRepo repo;

  FolderListViewModel(this.repo);

  bool _loading = false;
  String _errorMessage = '';

  bool get loading => _loading; // Getter method to access the loading flag.
  String get errorMessage => _errorMessage; // Getter method to access the error message.
  dynamic Folderdata = {};

  //String sTemp='{"mode":"BROWSE","sortBy":{"criteria":"","order":"ASC"},"groupBy":"","filterBy":[],"itemsPerPage":50,"currentPage":1}';
  Map<String, dynamic> payload = jsonDecode(
      '{"mode":"BROWSE","sortBy":{"criteria":"","order":"ASC"},"groupBy":"","filterBy":[],"itemsPerPage":50,"currentPage":1}');

  //sample
/*  final payload = {
    'token': sessionController.token.value,
    'type': type,
    'workflowId': activeWorkflow.id,
    'pagination': <String, dynamic>{
      'rowFrom': from ?? 1,
      'rowTo': to ?? itemsPerPage,
    },
  };*/

  //To be create
/*  final payloaddata = {
    'mode': "Browse",
    "sortBy": {"criteria": ""}
  };*/

  Future<void> fetchFolderData() async {
    _loading = true; // Set loading flag to true before making the API call.
    _errorMessage = ''; // Clear any previous error message.
    final stemp = {
      'mode': 'BROWSE',
      'sortBy': {'criteria': '', 'order': 'ASC'},
      'groupBy': '',
      'filterBy': [],
      'itemsPerPage': 50,
      'currentPage': 1
    };
    try {
      // Call the getFolderData() method for  folder list  using api
      Folderdata = await repo.getFolderData(AaaEncryption.EncryptDatatest(jsonEncode(stemp)));

      SVProgressHUD.dismiss(); //
    } catch (e) {
      // If an exception occurs during the API call, set the error message to display the error.
      _errorMessage = 'Failed to fetch datas';
    } finally {
      // After API call is completed, set loading flag to false and notify listeners of data change.
      _loading = false;
      notifyListeners();
    }
  }
}

import 'dart:async';

import 'package:ez/core/utils/strings.dart';
import 'package:ez/features/workflow/model/Panel.dart';
import 'package:ez/features/workflow/repository/repository.dart';
import 'package:ez/features/workflowinitiate/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

class WorkflowInitiateViewModel extends ChangeNotifier {
  final WorkflowInitiateRepo repo;

  WorkflowInitiateViewModel(this.repo);

  dynamic dataSet = {};
  dynamic panels = {};

  bool _loading = false;
  String _errorMessage = '';

  bool get loading => _loading; // Getter method to access the loading flag.
  String get errorMessage =>
      _errorMessage; // Getter method to access the error message.

  Future<void> fetchData() async {
    _loading = true; // Set loading flag to true before making the API call.
    _errorMessage = ''; // Clear any previous error message.

    try {
      // Call the getUsers() method from the UserRepository to fetch data from the API.
      dataSet = await repo.getData() as dynamic;
      panels = await repo.convertJsonStringtoObject(dataSet.formJson ?? "");
      SVProgressHUD.dismiss();
    } catch (e) {
      // If an exception occurs during the API call, set the error message to display the error.
      _errorMessage = Strings.txt_error_fetchfailed;
    } finally {
      // After API call is completed, set loading flag to false and notify listeners of data change.
      _loading = false;
      notifyListeners();
    }
  }
}

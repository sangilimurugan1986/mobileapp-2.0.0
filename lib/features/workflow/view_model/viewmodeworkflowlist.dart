import 'dart:async';
import 'dart:convert';

import 'package:ez/features/workflow/model/Panel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import '../../../api/workflow_repo.dart';
import '../../../models/MenuInbox.dart';
import '../../../utils/helper/aes_encryption.dart';
import '../../../widgets/testinbox.dart';
import '../repository/repositorylist.dart';

class WorkflowListViewModel extends ChangeNotifier {
  final WorkflowListRepo repo;
  List<MenuInbox> data = [];
  late MenuInbox miList;

  WorkflowListViewModel(this.repo);

  bool _loading = false;
  String _errorMessage = '';

  bool get loading => _loading; // Getter method to access the loading flag.
  String get errorMessage => _errorMessage; // Getter method to access the error message.

  Future<void> fetchData() async {
    _loading = true; // Set loading flag to true before making the API call.
    _errorMessage = ''; // Clear any previous error message.

    try {
      // Call the getUsers() method from the UserRepository to fetch data from the API.
      data = await repo.getDataList() as dynamic;

      SVProgressHUD.dismiss();
    } catch (e) {
      // If an exception occurs during the API call, set the error message to display the error.
      _errorMessage = 'Failed to fetch data';
    } finally {
      // After API call is completed, set loading flag to false and notify listeners of data change.
      _loading = false;
      notifyListeners();
    }
  }
}

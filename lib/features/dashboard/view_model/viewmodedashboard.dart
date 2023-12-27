import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import '../repository/repository.dart';

class DashboardViewModel extends ChangeNotifier {
  final DashboardRepo repo;

  DashboardViewModel(this.repo);

  bool _loading = false;
  String _errorMessage = '';

  bool get loading => _loading; // Getter method to access the loading flag.
  String get errorMessage => _errorMessage; // Getter method to access the error message.
  String data = '0';

  Future<void> fetchCountData() async {
    _loading = true; // Set loading flag to true before making the API call.
    _errorMessage = ''; // Clear any previous error message.

    try {
      // Call the getCountData() method for total inbox count using api
      data = await repo.getCountData();

      SVProgressHUD.dismiss();
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

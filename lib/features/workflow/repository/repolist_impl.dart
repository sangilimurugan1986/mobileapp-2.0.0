import 'dart:convert';

import 'package:ez/features/workflow/repository/repositorylist.dart';

import '../../../api/workflow_repo.dart';
import '../../../core/ApiClient/ApiService.dart';
import '../../../models/MenuInbox.dart';
import '../../../utils/helper/aes_encryption.dart';

class WorkflowListRepoImpl implements WorkflowListRepo {
  final FileManager apiService;

  WorkflowListRepoImpl(this.apiService);

  @override
  Future<List<MenuInbox>> getDataList() async {
    try {
      // Call the getUsers() method from the ApiService to fetch user data from the API.
      // final data = await apiService.getData('assets/form.json');
      final response = await WorkflowRepo.getlistByUserId();
      final dtemp = AaaEncryption.decryptAESaaa(response.data);
      List datas = json.decode(dtemp);
      List<MenuInbox> data = [];
      datas.forEach((element) {
        data.add(MenuInbox.fromJson(element));
      });

      // Map the API response data to a List of data objects using the User.fromJson() constructor.
      return data;
    } catch (e) {
      // If an exception occurs during the API call, throw an exception with an error message.
      throw Exception('Failed to fetch users');
    }
  }
}

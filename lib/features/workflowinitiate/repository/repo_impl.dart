import 'dart:convert';

import 'package:ez/core/utils/strings.dart';
import 'package:ez/features/workflow/repository/repository.dart';
import 'package:ez/features/workflowinitiate/model/workflowmain.dart';
import 'package:ez/features/workflowinitiate/repository/repository.dart';
import 'package:ez/pages/workflowmain.dart';

import '../../../api/auth_repo.dart';
import '../../../core/ApiClient/ApiService.dart';
import '../../../core/ApiClient/endpoint.dart';
import '../../../utils/helper/aes_encryption.dart';
import '../../workflow/model/Panel.dart';

class WorkflowInitiateRepoImpl implements WorkflowInitiateRepo {
  final ApiManager apiService;

  WorkflowInitiateRepoImpl(this.apiService);

  @override
  Future<dynamic> getData(String sFormId) async {
    try {
      // Call the getUsers() method from the ApiService to fetch user data from the API.
      // final data = await apiService.getData('assets/workflow_main.json');
      final datas = await apiService.getDataWithHeader(
          EndPoint.BaseUrl + EndPoint.formworkflowinitiate + sFormId, AaaEncryption.sToken);
      Map<String, dynamic> data = jsonDecode(AaaEncryption.decryptAESaaa(datas));
      // Map the API response data to a List of data objects using the User.fromJson() constructor.
      final result = workflowmain.fromJson(data);
      return result;
    } catch (e) {
      // If an exception occurs during the API call, throw an exception with an error message.
      throw Exception(Strings.txt_error_fetchfailed);
    }
  }

  @override
  Future<dynamic> convertJsonStringtoObject(String jsonString) async {
    try {
      // Call the convertJsonStringtoObject to decode jsonString to jsonObject.
      final data = json.decode(jsonString);
      // Map the API response data to a List of data objects using the User.fromJson() constructor.
      final result = Panel.fromJson(data);

      return result;
    } catch (e) {
      // If an exception occurs during the API call, throw an exception with an error message.
      throw Exception(Strings.txt_error_fetchfailed);
    }
  }
}

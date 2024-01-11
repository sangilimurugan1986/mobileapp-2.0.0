import 'dart:convert';

import 'package:ez/features/dashboard/repository/repository.dart';
import 'package:ez/features/folder/repository/repository.dart';
import '../../../api/auth_repo.dart';
import '../../../api/folder_repo.dart';
import '../../../core/ApiClient/ApiService.dart';
import '../../../utils/helper/aes_encryption.dart';

class FolderListRepoImpl implements FolderListRepo {
  final FileManager apiService;

  FolderListRepoImpl(this.apiService);

  @override
  Future<dynamic> getFolderData(String payload) async {
    try {
      //Blue - #00BCD4  Purple - #643094        Blue 2nd - #00C8E2
      // Call the get Folder Data() method from the ApiService to get Folders/Repository.
      final response = await FolderRepo.getRepositoriesList(payload);
      String stemp = AaaEncryption.decryptAESaaa(response.data.toString());
      Map<String, dynamic> valueMap = jsonDecode(stemp);
      return valueMap['data'][0]['value']; //
    } catch (e) {
      // If an exception occurs during the API call, throw an exception with an error message.
      throw Exception('Failed to fetch repositories');
    }
  }

/*  void getTotalInboxCount() async {
    final responses = await AuthRepo.getTotalInboxCount();
    final ttemp = AaaEncryption.decryptAESaaa(responses.toString());

    if (int.parse(ttemp) > 0)
      iPendingtask.value = ttemp;
    else
      iPendingtask.value = '0';
  }*/
}

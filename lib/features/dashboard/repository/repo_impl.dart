import 'package:ez/features/dashboard/repository/repository.dart';
import '../../../api/auth_repo.dart';
import '../../../core/ApiClient/ApiService.dart';
import '../../../utils/helper/aes_encryption.dart';

class DashboardRepoImpl implements DashboardRepo {
  final FileManager apiService;

  DashboardRepoImpl(this.apiService);

  @override
  Future<String> getCountData() async {
    try {
      //Blue - #00BCD4  Purple - #643094        Blue 2nd - #00C8E2
      // Call the getTotalInboxCount() method from the ApiService to get Inbox Count.
      print('getCountData 123');
      final response = await AuthRepo.getTotalInboxCount();
      final data = AaaEncryption.decryptAESaaa(response.toString());
      // Map the API response data to a List of data objects using the User.fromJson() constructor.
      return data;
    } catch (e) {
      // If an exception occurs during the API call, throw an exception with an error message.
      throw Exception('Failed to fetch users');
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

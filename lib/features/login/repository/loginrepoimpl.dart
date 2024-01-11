import 'package:ez/core/ApiClient/ApiService.dart';
import 'package:ez/core/utils/strings.dart';
import 'package:ez/features/login/repository/loginrepo.dart';

class LoginRepoImpl extends LoginReposity {
  late final ApiManager apiService;
  LoginRepoImpl(this.apiService);

  @override
  Future<dynamic> validateCredentials(String path, var data) async {
    try {
      final _data = await apiService.postdata(path, data);
      // final result = workflowmain.fromJson(_data);
      return _data;
    } catch (e) {
      throw Exception(Strings.txt_error_fetchfailed);
    }
  }
}

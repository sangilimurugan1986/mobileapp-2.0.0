import 'package:ez/core/ApiClient/ApiService.dart';
import 'package:ez/features/login/repository/loginrepo.dart';

class LoginRepoImpl extends LoginReposity {
  late final ApiManager apiService;
  LoginRepoImpl(this.apiService);

  @override
  Future<dynamic> validateCredentials(String path, var data) async {
    final _data = await apiService.postdata(path, data);
    // final result = workflowmain.fromJson(_data);
    return _data;
    try {} catch (e) {
      throw Exception();
    }
  }

  @override
  Future<dynamic> userDataCredentials(String path, var token) async {
    final _data = await apiService.getDataWithHeader(path, token);
    return _data;
  }
}

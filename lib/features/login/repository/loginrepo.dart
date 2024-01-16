abstract class LoginReposity {
  Future<dynamic> validateCredentials(String path, var data);
  Future<dynamic> userDataCredentials(String path, var token);
}

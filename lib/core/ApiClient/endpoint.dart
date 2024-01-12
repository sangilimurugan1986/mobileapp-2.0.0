class EndPoint {
  //:- Api Urls
  static const baseUrl = "http://52.172.32.88/CoreAPI/api/";

  //:- method endpoints
  static const login = "authentication/login";
  static const api_taskList = "form/19/entry/all";

  static String getPath({required String method}) {
    var path = baseUrl + method;
    return path;
  }
}

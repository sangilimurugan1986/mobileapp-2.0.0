import 'package:ez/core/utils/extension+Strings.dart';

class LoginRequest {
  String? email;
  String? loggedFrom;
  String? password;
  int? portalId;

  LoginRequest({this.email, this.loggedFrom, this.password, this.portalId});

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      email: json['email'],
      loggedFrom: json['loggedFrom'],
      password: json['password'],
      portalId: json['portalId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['loggedFrom'] = this.loggedFrom;
    data['password'] = this.password;
    data['portalId'] = this.portalId;
    return data;
  }

  Future<bool> fieldsValidation() async {
    if (this.email!.isValidEmail) {
      return true;
    } else {
      return false;
    }
  }
}

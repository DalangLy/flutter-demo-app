import 'package:demo_app/features/login/domain/entities/login.dart';

class LoginModel extends Login{
  final String _username;
  final String _password;

  LoginModel(this._username, this._password) : super(_username, _password);

  Map<String, String> toJson(){
    return {
      'name': _username,
      'password': _password,
    };
  }

  factory LoginModel.fromEntity(Login login){
    return LoginModel(login.username, login.password);
  }
}
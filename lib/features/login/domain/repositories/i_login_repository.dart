import 'package:demo_app/features/login/domain/entities/login.dart';

abstract class ILoginRepository{
  Future<String> login(Login login);
  Future<void> saveToken(String token);
  Future<String> getToken();
}
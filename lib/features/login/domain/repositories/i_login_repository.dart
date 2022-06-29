import 'package:demo_app/features/login/domain/entities/login.dart';

abstract class ILoginRepository{
  Future<void> login(Login login);
}
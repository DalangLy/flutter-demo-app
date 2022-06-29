import 'package:demo_app/features/login/data/models/login_model.dart';

abstract class ILoginDataSource{
  Future<void> login(LoginModel loginModel);
}
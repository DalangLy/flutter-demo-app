import 'package:demo_app/features/login/data/models/login_model.dart';

abstract class ILoginRemoteDataSource{
  Future<String> login(LoginModel loginModel);
}
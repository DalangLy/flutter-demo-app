import 'package:demo_app/features/login/data/data_sources/i_login_data_source.dart';
import 'package:demo_app/features/login/data/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRemoteDataSource implements ILoginDataSource{
  final Dio _dio;

  LoginRemoteDataSource(this._dio);

  @override
  Future<void> login(LoginModel loginModel) async{
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    try{
      final Response response = await _dio.post(
        'https://96.9.67.188:4434/api/users/login',
        data: loginModel.toJson(),
      );
      if(response.statusCode == 200){
        final token = response.data['data'];
        final SharedPreferences prefs = await _prefs;
        prefs.setString('accessToken', token);
      }
    }catch(e){
      print(e);
    }
  }
}
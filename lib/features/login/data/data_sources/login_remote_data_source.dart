import 'dart:convert';
import 'package:demo_app/core/app_config.dart';
import 'package:demo_app/core/errors/server_down_failure.dart';
import 'package:demo_app/features/login/data/data_sources/i_login_remote_data_source.dart';
import 'package:demo_app/features/login/data/models/login_model.dart';
import 'package:dio/dio.dart';

class LoginRemoteDataSource implements ILoginRemoteDataSource{
  final Dio _dio;

  LoginRemoteDataSource(this._dio);

  @override
  Future<String> login(LoginModel loginModel) async{
    try{
      final Response response = await _dio.post(
        '$baseUrl/api/users/login',
        data: json.encode(loginModel.toJson()),
      );
      if(response.statusCode == 200){
        final token = response.data['data'];
        return token;
      }
      else if(response.statusCode == 500){
        throw ServerDownFailure('Server Down');
      }
      throw Exception();
    }catch(e){
      throw Exception(e);
    }
  }
}
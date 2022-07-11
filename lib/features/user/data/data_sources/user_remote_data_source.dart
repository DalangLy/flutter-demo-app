import 'dart:convert';
import 'package:demo_app/features/user/data/data_sources/i_user_remote_data_source.dart';
import 'package:demo_app/features/user/data/models/create_user_model.dart';
import 'package:dio/dio.dart';
import '../../../../core/app_config.dart';
import '../../../../core/errors/unauthenticated_failure.dart';

class UserRemoteDataSource implements IUserRemoteDataSource{
  final Dio _dio;

  UserRemoteDataSource(this._dio);

  @override
  Future<String> create(CreateUserModel model, String accessToken) async{
    try{
      final Response response = await _dio.post(
          '$baseUrl/api/users/register',
          data: json.encode(
              model.toJson()
          ),
          options: Options(
              headers: {
                'Authorization': 'Bearer $accessToken',
              }
          )
      );

      if(response.statusCode == 200){
        final List<dynamic> parsed = response.data['data'];
        return parsed[0];
      }
      else if(response.statusCode == 401){
        throw UnauthenticatedFailure('UnAuthentication');
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }
}
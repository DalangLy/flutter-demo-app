import 'dart:convert';
import 'package:demo_app/features/ware/data/models/create_ware_model.dart';
import 'package:demo_app/features/ware/data/models/update_ware_model.dart';
import 'package:dio/dio.dart';
import '../models/ware_model.dart';
import 'i_ware_remote_data_source.dart';

class WareRemoteDataSource implements IWareRemoteDataSource{
  final Dio _dio;

  WareRemoteDataSource(this._dio);

  @override
  Future<List<WareModel>> getAll(String accessToken) async{
    try{
      final Response response = await _dio.post(
          'https://96.9.67.188:4434/api/Wares/GetAll',
          data: {

          },
          options: Options(
              headers: {
                'Authorization': 'Bearer $accessToken',
              }
          )
      );

      if(response.statusCode == 200){
        final List<dynamic> parsed = response.data['data'];
        return parsed.map<WareModel>((json) => WareModel.fromJson(json)).toList();
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<String> create(CreateWareModel model, String accessToken) async{
    try{
      final dd = json.encode(
          {
            'commands':
            [
              model.toJson()
            ]
          }
      );
      final Response response = await _dio.post(
          'https://96.9.67.188:4434/api/Wares',
          data: dd,
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
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<String> delete(String id, String accessToken) async{
    try{
      final Response response = await _dio.delete(
        'https://96.9.67.188:4434/api/wares',
        data: {
          "ids":[
            id
          ]
        },
        options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
            }
        ),
      );
      if(response.statusCode == 200){
        final List<dynamic> parsed = response.data['data'];
        return parsed[0];
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<WareModel> getById(String id, String accessToken) async{
    try{
      final Response response = await _dio.get(
        'https://96.9.67.188:4434/api/Wares/$id',
        options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
            }
        ),
      );
      if(response.statusCode == 200){
        final dynamic parsed = response.data['data'];
        if(parsed == null) throw Exception();
        return WareModel.fromJson(parsed);
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<String> update(UpdateWareModel model, String accessToken) async{
    try{
      final dd = json.encode(
          {
            'commands':
            [
              model.toJson()
            ]
          }
      );
      final Response response = await _dio.put(
          'https://96.9.67.188:4434/api/wares',
          data: dd,
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
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }
}
import 'dart:convert';

import 'package:demo_app/features/stock/data/models/create_stock_model.dart';
import 'package:demo_app/features/stock/data/models/update_stock_model.dart';
import 'package:dio/dio.dart';
import '../models/stock_model.dart';
import 'i_stock_remote_data_source.dart';

class StockRemoteDataSource implements IStockRemoteDataSource{
  final Dio _dio;

  StockRemoteDataSource(this._dio);

  @override
  Future<List<StockModel>> getAll(String accessToken) async{
    try{
      final Response response = await _dio.post(
          'https://96.9.67.188:4434/api/stockings/getall',
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
        return parsed.map<StockModel>((json) => StockModel.fromJson(json)).toList();
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
        'https://96.9.67.188:4434/api/stockings',
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
  Future<String> create(CreateStockModel stock, String accessToken) async{
    try{
      final dd = json.encode(
          {
            'commands':
            [
              stock.toJson()
            ]
          }
      );
      final Response response = await _dio.post(
          'https://96.9.67.188:4434/api/stockings',
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
  Future<String> update(UpdateStockModel stock, String accessToken) async{
    try{
      final dd = json.encode(
          {
            'commands':
            [
              stock.toJson()
            ]
          }
      );
      final Response response = await _dio.put(
          'https://96.9.67.188:4434/api/stockings',
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
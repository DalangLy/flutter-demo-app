import 'dart:convert';
import 'package:demo_app/features/stock/data/models/create_for_product_model.dart';
import 'package:demo_app/features/stock/data/models/create_stock_model.dart';
import 'package:demo_app/features/stock/data/models/transfer_stock_model.dart';
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
  Future<String> create(CreateStockModel model, String accessToken) async{
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
  Future<String> update(UpdateStockModel model, String accessToken) async{
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
  Future<StockModel> getById(String id, String accessToken) async{
    try{
      final Response response = await _dio.get(
        'https://96.9.67.188:4434/api/stockings/$id',
        options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
            }
        ),
      );
      if(response.statusCode == 200){
        final dynamic parsed = response.data['data'];
        if(parsed == null) throw Exception();
        return StockModel.fromJson(parsed);
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<String> transfer(TransferStockModel model, String accessToken) async{
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
        'https://96.9.67.188:4434/api/stockings',
        data: dd,
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
  Future<String> createForNewProduct(CreateForProductModel model, String accessToken) async{
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
          'https://96.9.67.188:4434/api/stockings/newproduct',
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
  Future<StockModel> getByProduct(String productId, String accessToken) async{
    try{
      final dd = json.encode(
          {
            'productids':
            [
              productId
            ]
          }
      );
      final Response response = await _dio.post(
        'https://96.9.67.188:4434/api/stockings/GetByProducts',
        data: dd,
        options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
            }
        ),
      );
      if(response.statusCode == 200){
        final dynamic parsed = response.data['data'];
        if(parsed == null) throw Exception();
        return StockModel.fromJson(parsed);
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<StockModel> getByProductCode(String productCode, String accessToken) async{
    try{
      final dd = json.encode(
          {
            'productcodes':
            [
              productCode
            ]
          }
      );
      final Response response = await _dio.post(
        'https://96.9.67.188:4434/api/stockings/GetByProductCodes',
        data: dd,
        options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
            }
        ),
      );
      if(response.statusCode == 200){
        final dynamic parsed = response.data['data'];
        if(parsed == null) throw Exception();
        return StockModel.fromJson(parsed);
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<StockModel> getByWare(String wareId, String accessToken) async{
    try{
      final dd = json.encode(
          {
            'wareids':
            [
              wareId
            ]
          }
      );
      final Response response = await _dio.post(
        'https://96.9.67.188:4434/api/stockings/GetByWares',
        data: dd,
        options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
            }
        ),
      );
      if(response.statusCode == 200){
        final dynamic parsed = response.data['data'];
        if(parsed == null) throw Exception();
        return StockModel.fromJson(parsed);
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }
}
import 'dart:convert';
import 'package:demo_app/core/app_config.dart';
import 'package:demo_app/features/stock/data/models/create_for_product_model.dart';
import 'package:demo_app/features/stock/data/models/create_stock_model.dart';
import 'package:demo_app/features/stock/data/models/transfer_stock_model.dart';
import 'package:demo_app/features/stock/data/models/update_stock_model.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/unauthenticated_failure.dart';
import '../models/stock_model.dart';
import 'i_stock_remote_data_source.dart';

class StockRemoteDataSource implements IStockRemoteDataSource{
  final Dio _dio;

  StockRemoteDataSource(this._dio);

  @override
  Future<List<StockModel>> getAll(String accessToken) async{
    try{
      final Response response = await _dio.post(
          '$baseUrl/api/stockings/getall',
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
      else if(response.statusCode == 401){
        throw UnauthenticatedFailure('UnAuthentication');
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
        '$baseUrl/api/stockings',
        data: json.encode(
            {
              "ids":[
                id
              ]
            }
        ),
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
      else if(response.statusCode == 401){
        throw UnauthenticatedFailure('UnAuthentication');
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<String> create(CreateStockModel model, String accessToken) async{
    try{
      final Response response = await _dio.post(
          '$baseUrl/api/stockings',
          data: json.encode(
              {
                'commands':
                [
                  model.toJson()
                ]
              }
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

  @override
  Future<String> update(UpdateStockModel model, String accessToken) async{
    try{
      final Response response = await _dio.put(
          '$baseUrl/api/stockings',
          data: json.encode(
              {
                'commands':
                [
                  model.toJson()
                ]
              }
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

  @override
  Future<StockModel> getById(String id, String accessToken) async{
    try{
      final Response response = await _dio.get(
        '$baseUrl/api/stockings/$id',
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
      else if(response.statusCode == 401){
        throw UnauthenticatedFailure('UnAuthentication');
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<String> transfer(TransferStockModel model, String accessToken) async{
    try{
      final Response response = await _dio.put(
        '$baseUrl/api/stockings',
        data: json.encode(
            {
              'commands':
              [
                model.toJson()
              ]
            }
        ),
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
      else if(response.statusCode == 401){
        throw UnauthenticatedFailure('UnAuthentication');
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<String> createForNewProduct(CreateForProductModel model, String accessToken) async{
    try{
      final Response response = await _dio.post(
          '$baseUrl/api/stockings/newproduct',
          data: json.encode(
              {
                'commands':
                [
                  model.toJson()
                ]
              }
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

  @override
  Future<StockModel> getByProduct(String productId, String accessToken) async{
    try{
      final Response response = await _dio.post(
        '$baseUrl/api/stockings/GetByProducts',
        data: json.encode(
            {
              'productids':
              [
                productId
              ]
            }
        ),
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
      else if(response.statusCode == 401){
        throw UnauthenticatedFailure('UnAuthentication');
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<StockModel> getByProductCode(String productCode, String accessToken) async{
    try{
      final Response response = await _dio.post(
        '$baseUrl/api/stockings/GetByProductCodes',
        data: json.encode(
            {
              'productcodes':
              [
                productCode
              ]
            }
        ),
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
      else if(response.statusCode == 401){
        throw UnauthenticatedFailure('UnAuthentication');
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<StockModel> getByWare(String wareId, String accessToken) async{
    try{
      final Response response = await _dio.post(
        '$baseUrl/api/stockings/GetByWares',
        data: json.encode(
            {
              'wareids':
              [
                wareId
              ]
            }
        ),
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
      else if(response.statusCode == 401){
        throw UnauthenticatedFailure('UnAuthentication');
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }
}
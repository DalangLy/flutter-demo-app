import 'dart:convert';
import 'package:demo_app/core/app_config.dart';
import 'package:demo_app/core/errors/unauthenticated_failure.dart';
import 'package:demo_app/features/product/data/models/create_product_model.dart';
import 'package:demo_app/features/product/data/models/product_model.dart';
import 'package:demo_app/features/product/data/models/update_product_model.dart';
import 'package:dio/dio.dart';
import 'i_product_remote_data_source.dart';

class ProductRemoteDataSource implements IProductRemoteDataSource{

  final Dio _dio;

  ProductRemoteDataSource(this._dio);

  @override
  Future<String> create(CreateProductModel product, String accessToken) async{
    try{
      final Response response = await _dio.post(
          '$baseUrl/api/Products',
          data: json.encode(
              {
                'commands':
                [
                  product.toJson()
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
  Future<List<ProductModel>> getAll(String accessToken) async{
    try{
      final Response response = await _dio.post(
          '$baseUrl/api/Products/GetAll',
          data: json.encode(
              {
                'ids': null
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
        return parsed.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
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
        '$baseUrl/api/Products',
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
  Future<ProductModel> getById(String id, String accessToken) async{
    try{
      final Response response = await _dio.get(
        '$baseUrl/api/Products/$id',
        options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
            }
        ),
      );
      if(response.statusCode == 200){
        final dynamic parsed = response.data['data'];
        if(parsed == null) throw Exception();
        return ProductModel.fromJson(parsed);
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
  Future<String> update(UpdateProductModel product, String accessToken) async{
    try{
      final Response response = await _dio.put(
          '$baseUrl/api/Products',
          data: json.encode(
              {
                'commands':
                [
                  product.toJson()
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
}
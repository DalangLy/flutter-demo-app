import 'dart:convert';
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
      final dd = json.encode(
        {
          'commands':
          [
            product.toJson()
          ]
        }
      );
      final Response response = await _dio.post(
          'https://96.9.67.188:4434/api/Products',
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
  Future<List<ProductModel>> getAll(String accessToken) async{
    try{
      final Response response = await _dio.post(
          'https://96.9.67.188:4434/api/Products/GetAll',
          data: {
            'ids': null
          },
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
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<String> delete(String id, String accessToken) async{
    try{
      final Response response = await _dio.delete(
        'https://96.9.67.188:4434/api/Products',
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
  Future<ProductModel> getById(String id, String accessToken) async{
    try{
      final Response response = await _dio.get(
        'https://96.9.67.188:4434/api/Products/$id',
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
      throw Exception();
    }catch(e){
      throw Exception();
    }
  }

  @override
  Future<String> update(UpdateProductModel product, String accessToken) async{
    try{
      final dd = json.encode(
          {
            'commands':
            [
              product.toJson()
            ]
          }
      );
      final Response response = await _dio.put(
          'https://96.9.67.188:4434/api/Products',
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
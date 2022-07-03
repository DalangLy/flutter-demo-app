import 'package:demo_app/features/product/data/models/create_product_model.dart';
import 'package:demo_app/features/product/data/models/product_model.dart';
import 'package:dio/dio.dart';
import 'i_product_remote_data_source.dart';

class ProductRemoteDataSource implements IProductRemoteDataSource{
  final Dio _dio;

  ProductRemoteDataSource(this._dio);

  @override
  Future<void> create(CreateProductModel product, String accessToken) async{
    try{
      final Response response = await _dio.post(
          'https://96.9.67.188:4434/api/Products/GetAll',
          data: product.toJson(),
          options: Options(
              headers: {
                'Authorization': 'Bearer $accessToken',
              }
          )
      );

      if(response.statusCode == 200){
        final List<dynamic> parsed = response.data['data'];
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
          )
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
}
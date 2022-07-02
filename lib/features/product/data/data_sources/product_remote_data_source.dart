import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';
import 'i_product_remote_data_source.dart';

class ProductRemoteDataSource implements IProductRemoteDataSource{
  final Dio _dio;

  ProductRemoteDataSource(this._dio);

  @override
  Future<List<ProductModel>> getAll() async{
    try{
      final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;

      final String? token = prefs.getString('accessToken');
      final Response response = await _dio.post(
        'https://96.9.67.188:4434/api/Products/GetAll',
        data: {
          'ids': null
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
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
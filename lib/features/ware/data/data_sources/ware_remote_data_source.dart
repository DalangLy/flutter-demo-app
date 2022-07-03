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
}
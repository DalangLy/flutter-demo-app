import 'package:dio/dio.dart';
import '../models/stock_model.dart';
import 'i_stock_remote_data_source.dart';

class StockRemoteDataSource implements IStockRemoteDataSource{
  final Dio _dio;

  StockRemoteDataSource(this._dio);

  @override
  Future<List<StockModel>> getAll() async{
    try{
      const String token = 'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiQWRtaW5pc3RyYXRvciIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6WyJBZG1pbiIsIlVzZXIiXSwibmJmIjoxNjU2NjY4MDc5LCJleHAiOjE2NTY2Njk4Nzl9.6Wx9zwxv9cX0V84_dJ52yhwVPsdd55ktsyreZE6pmhHTDR_SOBTF422JvOAULkX_HpP8SG4SurXvXSwLPL1Big';
      final Response response = await _dio.post(
          'https://96.9.67.188:4434/api/stockings/getall',
          data: {

          },
          options: Options(
              headers: {
                'Authorization': 'Bearer $token',
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
}
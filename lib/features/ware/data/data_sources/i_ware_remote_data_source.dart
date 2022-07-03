import '../models/ware_model.dart';

abstract class IWareRemoteDataSource{
  Future<List<WareModel>> getAll(String accessToken);
}
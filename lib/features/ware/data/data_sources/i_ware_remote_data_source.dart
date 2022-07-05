import '../models/create_ware_model.dart';
import '../models/update_ware_model.dart';
import '../models/ware_model.dart';

abstract class IWareRemoteDataSource{
  Future<List<WareModel>> getAll(String accessToken);
  Future<String> create(CreateWareModel model, String accessToken);
  Future<String> delete(String id, String accessToken);
  Future<WareModel> getById(String id, String accessToken);
  Future<String> update(UpdateWareModel model, String accessToken);
}
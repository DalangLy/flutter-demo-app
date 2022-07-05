import 'package:demo_app/features/ware/data/models/create_ware_model.dart';
import 'package:demo_app/features/ware/data/models/update_ware_model.dart';
import 'package:demo_app/features/ware/domain/entities/create_ware_entity.dart';
import 'package:demo_app/features/ware/domain/entities/update_ware_entity.dart';
import '../../domain/entities/ware_entity.dart';
import '../../domain/repositories/i_ware_repository.dart';
import '../data_sources/i_ware_remote_data_source.dart';

class WareRepository implements IWareRepository{
  final IWareRemoteDataSource _remoteDataSource;

  WareRepository(this._remoteDataSource,);

  @override
  Future<String> create(CreateWareEntity ware, String accessToken) {
    return _remoteDataSource.create(CreateWareModel.fromEntity(ware), accessToken);
  }

  @override
  Future<String> delete(String id, String accessToken) {
    return _remoteDataSource.delete(id, accessToken);
  }

  @override
  Future<List<WareEntity>> getAll(String accessToken) {
    return _remoteDataSource.getAll(accessToken);
  }

  @override
  Future<WareEntity> getById(String id, String accessToken) {
    return _remoteDataSource.getById(id, accessToken);
  }

  @override
  Future<String> update(UpdateWareEntity ware, String accessToken) {
    return _remoteDataSource.update(UpdateWareModel.fromEntity(ware), accessToken);
  }
}
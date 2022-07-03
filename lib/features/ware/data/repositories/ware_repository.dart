import '../../../login/data/data_sources/i_login_local_data_source.dart';
import '../../domain/entities/ware.dart';
import '../../domain/repositories/i_ware_repository.dart';
import '../data_sources/i_ware_remote_data_source.dart';

class WareRepository implements IWareRepository{
  final IWareRemoteDataSource _remoteDataSource;

  WareRepository(this._remoteDataSource,);

  @override
  Future<void> create(Ware ware, String accessToken) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id, String accessToken) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Ware>> getAll(String accessToken) {
    return _remoteDataSource.getAll(accessToken);
  }

  @override
  Future<Ware> getById(String id, String accessToken) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> update(Ware ware, String accessToken) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
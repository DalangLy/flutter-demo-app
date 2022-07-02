import '../../domain/entities/ware.dart';
import '../../domain/repositories/i_ware_repository.dart';
import '../data_sources/i_ware_remote_data_source.dart';

class WareRepository implements IWareRepository{
  final IWareRemoteDataSource _remoteDataSource;

  WareRepository(this._remoteDataSource);

  @override
  Future<void> create(Ware ware) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Ware>> getAll() {
    return _remoteDataSource.getAll();
  }

  @override
  Future<Ware> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> update(Ware ware) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
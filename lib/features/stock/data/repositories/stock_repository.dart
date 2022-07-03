import '../../domain/entities/stock_entity.dart';
import '../../domain/repositories/i_stock_repository.dart';
import '../data_sources/i_stock_remote_data_source.dart';

class StockRepository implements IStockRepository{
  final IStockRemoteDataSource _remoteDataSource;

  StockRepository(this._remoteDataSource);
  
  @override
  Future<void> create(StockEntity stock) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<StockEntity>> getAll(String token) {
    return _remoteDataSource.getAll(token);
  }

  @override
  Future<StockEntity> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> update(StockEntity stock) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
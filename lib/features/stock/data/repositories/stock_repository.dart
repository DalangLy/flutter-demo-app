import '../../domain/entities/stock.dart';
import '../../domain/repositories/i_stock_repository.dart';
import '../data_sources/i_stock_remote_data_source.dart';

class StockRepository implements IStockRepository{
  final IStockRemoteDataSource _remoteDataSource;

  StockRepository(this._remoteDataSource);
  
  @override
  Future<void> create(Stock stock) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Stock>> getAll() {
    return _remoteDataSource.getAll();
  }

  @override
  Future<Stock> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> update(Stock stock) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
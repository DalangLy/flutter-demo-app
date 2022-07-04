import 'package:demo_app/features/stock/domain/entities/create_stock_entity.dart';
import 'package:demo_app/features/stock/domain/entities/update_stock_entity.dart';

import '../../domain/entities/stock_entity.dart';
import '../../domain/repositories/i_stock_repository.dart';
import '../data_sources/i_stock_remote_data_source.dart';
import '../models/update_stock_model.dart';

class StockRepository implements IStockRepository{
  final IStockRemoteDataSource _remoteDataSource;

  StockRepository(this._remoteDataSource);
  
  @override
  Future<String> create(CreateStockEntity stock, String accessToken) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<String> delete(String id, String accessToken) {
    return _remoteDataSource.delete(id, accessToken);
  }

  @override
  Future<List<StockEntity>> getAll(String token) {
    return _remoteDataSource.getAll(token);
  }

  @override
  Future<StockEntity> getById(String id, String accessToken) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<String> update(UpdateStockEntity stock, String accessToken) {
    return _remoteDataSource.update(UpdateStockModel.fromEntity(stock), accessToken);
  }
}
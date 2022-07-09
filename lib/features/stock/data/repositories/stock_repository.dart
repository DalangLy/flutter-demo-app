import 'package:demo_app/features/stock/data/models/create_for_product_model.dart';
import 'package:demo_app/features/stock/data/models/create_stock_model.dart';
import 'package:demo_app/features/stock/domain/entities/create_for_product_entity.dart';
import 'package:demo_app/features/stock/domain/entities/create_stock_entity.dart';
import 'package:demo_app/features/stock/domain/entities/transfer_stock_entity.dart';
import 'package:demo_app/features/stock/domain/entities/update_stock_entity.dart';

import '../../domain/entities/stock_entity.dart';
import '../../domain/repositories/i_stock_repository.dart';
import '../data_sources/i_stock_remote_data_source.dart';
import '../models/transfer_stock_model.dart';
import '../models/update_stock_model.dart';

class StockRepository implements IStockRepository{
  final IStockRemoteDataSource _remoteDataSource;

  StockRepository(this._remoteDataSource);
  
  @override
  Future<String> create(CreateStockEntity entity, String accessToken) {
    return _remoteDataSource.create(CreateStockModel.fromEntity(entity), accessToken);
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
    return _remoteDataSource.getById(id, accessToken);
  }

  @override
  Future<String> update(UpdateStockEntity entity, String accessToken) {
    return _remoteDataSource.update(UpdateStockModel.fromEntity(entity), accessToken);
  }

  @override
  Future<String> transfer(TransferStockEntity entity, String token) {
    return _remoteDataSource.transfer(TransferStockModel.fromEntity(entity), token);
  }

  @override
  Future<String> createForProduct(CreateForProductEntity entity, String token) {
    return _remoteDataSource.createForNewProduct(CreateForProductModel.fromEntity(entity), token);
  }

  @override
  Future<StockEntity> getByProduct(String productId, String token) {
    return _remoteDataSource.getByProduct(productId, token);
  }

  @override
  Future<StockEntity> getByProductCode(String productCode, String token) {
    return _remoteDataSource.getByProductCode(productCode, token);
  }

  @override
  Future<StockEntity> getByWare(String wareId, String token) {
    return _remoteDataSource.getByWare(wareId, token);
  }
}
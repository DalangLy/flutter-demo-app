import 'package:demo_app/features/stock/domain/entities/create_for_product_entity.dart';
import 'package:demo_app/features/stock/domain/entities/transfer_stock_entity.dart';
import 'package:demo_app/features/stock/domain/entities/update_stock_entity.dart';

import '../entities/create_stock_entity.dart';
import '../entities/stock_entity.dart';

abstract class IStockRepository{
  Future<List<StockEntity>> getAll(String token);
  Future<StockEntity> getById(String id, String token);
  Future<StockEntity> getByProductCode(String productCode, String token);
  Future<StockEntity> getByProduct(String productId, String token);
  Future<StockEntity> getByWare(String wareId, String token);
  Future<String> delete(String id, String token);
  Future<String> create(CreateStockEntity entity, String token);
  Future<String> update(UpdateStockEntity entity, String token);
  Future<String> transfer(TransferStockEntity entity, String token);
  Future<String> createForProduct(CreateForProductEntity entity, String token);
}
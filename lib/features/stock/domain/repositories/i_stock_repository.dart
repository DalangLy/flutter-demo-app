import 'package:demo_app/features/stock/domain/entities/update_stock_entity.dart';

import '../entities/create_stock_entity.dart';
import '../entities/stock_entity.dart';

abstract class IStockRepository{
  Future<List<StockEntity>> getAll(String token);
  Future<StockEntity> getById(String id, String token);
  Future<String> delete(String id, String token);
  Future<String> create(CreateStockEntity stock, String token);
  Future<String> update(UpdateStockEntity stock, String token);
}
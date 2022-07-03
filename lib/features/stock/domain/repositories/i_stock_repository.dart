import '../entities/stock_entity.dart';

abstract class IStockRepository{
  Future<List<StockEntity>> getAll(String token);
  Future<StockEntity> getById(String id);
  Future<void> delete(String id);
  Future<void> create(StockEntity stock);
  Future<void> update(StockEntity stock);
}
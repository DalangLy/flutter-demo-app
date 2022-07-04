import '../entities/stock_entity.dart';

abstract class IStockRepository{
  Future<List<StockEntity>> getAll(String token);
  Future<StockEntity> getById(String id, String token);
  Future<String> delete(String id, String token);
  Future<String> create(StockEntity stock, String token);
  Future<String> update(StockEntity stock, String token);
}
import '../entities/stock.dart';

abstract class IStockRepository{
  Future<List<Stock>> getAll();
  Future<Stock> getById(String id);
  Future<void> delete(String id);
  Future<void> create(Stock stock);
  Future<void> update(Stock stock);
}
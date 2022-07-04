import '../models/stock_model.dart';

abstract class IStockRemoteDataSource{
  Future<List<StockModel>> getAll(String accessToken);
  Future<String> delete(String id, String accessToken);
}
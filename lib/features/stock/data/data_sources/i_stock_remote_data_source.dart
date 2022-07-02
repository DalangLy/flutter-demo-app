import '../models/stock_model.dart';

abstract class IStockRemoteDataSource{
  Future<List<StockModel>> getAll();
}
import 'package:demo_app/features/stock/domain/entities/create_stock_entity.dart';

import '../models/create_stock_model.dart';
import '../models/stock_model.dart';
import '../models/update_stock_model.dart';

abstract class IStockRemoteDataSource{
  Future<List<StockModel>> getAll(String accessToken);
  Future<String> create(CreateStockModel stock, String accessToken);
  Future<String> delete(String id, String accessToken);
  Future<String> update(UpdateStockModel stock, String accessToken);
}
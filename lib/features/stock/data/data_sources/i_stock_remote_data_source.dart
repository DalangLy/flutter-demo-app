import '../models/create_for_product_model.dart';
import '../models/create_stock_model.dart';
import '../models/stock_model.dart';
import '../models/transfer_stock_model.dart';
import '../models/update_stock_model.dart';

abstract class IStockRemoteDataSource{
  Future<List<StockModel>> getAll(String accessToken);
  Future<String> create(CreateStockModel model, String accessToken);
  Future<String> delete(String id, String accessToken);
  Future<StockModel> getById(String id, String accessToken);
  Future<StockModel> getByProductCode(String productCode, String accessToken);
  Future<StockModel> getByWare(String wareId, String accessToken);
  Future<StockModel> getByProduct(String productId, String accessToken);
  Future<String> update(UpdateStockModel model, String accessToken);
  Future<String> transfer(TransferStockModel model, String accessToken);
  Future<String> createForNewProduct(CreateForProductModel model, String accessToken);
}
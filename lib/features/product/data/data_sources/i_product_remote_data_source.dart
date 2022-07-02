import '../models/product_model.dart';

abstract class IProductRemoteDataSource{
  Future<List<ProductModel>> getAll();
}
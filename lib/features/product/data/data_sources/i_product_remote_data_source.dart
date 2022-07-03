import 'package:demo_app/features/product/data/models/create_product_model.dart';
import 'package:demo_app/features/product/data/models/product_model.dart';

abstract class IProductRemoteDataSource{
  Future<List<ProductModel>> getAll(String accessToken);
  Future<void> create(CreateProductModel product, String accessToken);
}
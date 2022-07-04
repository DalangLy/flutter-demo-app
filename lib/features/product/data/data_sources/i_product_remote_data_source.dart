import 'package:demo_app/features/product/data/models/create_product_model.dart';
import 'package:demo_app/features/product/data/models/product_model.dart';
import 'package:demo_app/features/product/data/models/update_product_model.dart';

abstract class IProductRemoteDataSource{
  Future<List<ProductModel>> getAll(String accessToken);
  Future<String> create(CreateProductModel product, String accessToken);
  Future<String> delete(String id, String accessToken);
  Future<ProductModel> getById(String id, String accessToken);
  Future<String> update(UpdateProductModel product, String accessToken);
}
import '../entities/create_product_entity.dart';
import '../entities/product_entity.dart';

abstract class IProductRepository{
  Future<List<ProductEntity>> getAll(String accessToken);
  Future<String> create(CreateProductEntity product, String accessToken);
}
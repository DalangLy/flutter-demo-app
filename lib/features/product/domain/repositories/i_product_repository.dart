import '../entities/create_product_entity.dart';
import '../entities/product_entity.dart';
import '../entities/update_product_entity.dart';

abstract class IProductRepository{
  Future<List<ProductEntity>> getAll(String accessToken);
  Future<String> create(CreateProductEntity product, String accessToken);
  Future<String> update(UpdateProductEntity product, String accessToken);
  Future<String> delete(String id, String accessToken);
  Future<ProductEntity> getById(String id, String accessToken);
}
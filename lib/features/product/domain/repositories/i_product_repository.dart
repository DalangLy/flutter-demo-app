import '../entities/product.dart';

abstract class IProductRepository{
  Future<List<Product>> getAll(String accessToken);
  Future<Product> getById(String id, String accessToken);
  Future<void> delete(String id, String accessToken);
  Future<void> create(Product product, String accessToken);
  Future<void> update(Product product, String accessToken);
}
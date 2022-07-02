import '../../domain/entities/product.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../data_sources/i_product_remote_data_source.dart';

class ProductRepository implements IProductRepository{

  final IProductRemoteDataSource _remoteDataSource;

  ProductRepository(this._remoteDataSource);

  @override
  Future<void> create(Product product, String accessToken) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id, String accessToken) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getAll(String accessToken) {
    return _remoteDataSource.getAll();
  }

  @override
  Future<Product> getById(String id, String accessToken) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> update(Product product, String accessToken) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
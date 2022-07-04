import '../../domain/entities/create_product_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/update_product_entity.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../data_sources/i_product_remote_data_source.dart';
import '../models/create_product_model.dart';
import '../models/update_product_model.dart';

class ProductRepository implements IProductRepository{

  final IProductRemoteDataSource _remoteDataSource;

  ProductRepository(this._remoteDataSource);

  @override
  Future<String> create(CreateProductEntity product, String accessToken) {
    return _remoteDataSource.create(CreateProductModel.fromEntity(product), accessToken);
  }

  @override
  Future<List<ProductEntity>> getAll(String accessToken) {
    return _remoteDataSource.getAll(accessToken);
  }

  @override
  Future<String> delete(String id, String accessToken) {
    return _remoteDataSource.delete(id, accessToken);
  }

  @override
  Future<ProductEntity> getById(String id, String accessToken) {
    return _remoteDataSource.getById(id, accessToken);
  }

  @override
  Future<String> update(UpdateProductEntity product, String accessToken) {
    return _remoteDataSource.update(UpdateProductModel.fromEntity(product), accessToken);
  }
}
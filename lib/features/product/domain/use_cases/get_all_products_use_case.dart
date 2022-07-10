import 'package:demo_app/core/errors/unauthenticated_failure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../entities/product_entity.dart';
import '../repositories/i_product_repository.dart';

class GetAllProductsUseCase{
  final IProductRepository _repository;
  final ILoginRepository _loginRepository;

  GetAllProductsUseCase(this._repository, this._loginRepository);

  Future<List<ProductEntity>> call() async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailure('Unauthenticated');
    return await _repository.getAll(token);
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
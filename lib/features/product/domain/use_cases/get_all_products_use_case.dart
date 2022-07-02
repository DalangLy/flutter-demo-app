import 'package:demo_app/core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../entities/product.dart';
import '../repositories/i_product_repository.dart';

class GetAllProductsUseCase{
  final IProductRepository _repository;
  final ILoginRepository _loginRepository;

  GetAllProductsUseCase(this._repository, this._loginRepository);

  Future<List<Product>> call() async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailed('Unauthenticated');
    return _repository.getAll(token);
  }



  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
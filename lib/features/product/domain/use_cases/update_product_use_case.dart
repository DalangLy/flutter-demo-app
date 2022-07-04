import '../../../../core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../entities/update_product_entity.dart';
import '../repositories/i_product_repository.dart';

class UpdateProductUseCase{
  final IProductRepository _repository;
  final ILoginRepository _loginRepository;

  UpdateProductUseCase(this._repository, this._loginRepository);

  Future<void> call(UpdateProductEntity product) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailed('Unauthenticated');
    final updatedId = _repository.update(product, token);
    return null;
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
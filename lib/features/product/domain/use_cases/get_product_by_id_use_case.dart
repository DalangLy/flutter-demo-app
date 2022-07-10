import 'package:demo_app/features/product/domain/entities/product_entity.dart';
import '../../../../core/errors/unauthenticated_failure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../repositories/i_product_repository.dart';

class GetProductByIdUseCase{
  final IProductRepository _repository;
  final ILoginRepository _loginRepository;

  GetProductByIdUseCase(this._repository, this._loginRepository);

  Future<ProductEntity> call(String id) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailure('Unauthenticated');
    return await _repository.getById(id, token);
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
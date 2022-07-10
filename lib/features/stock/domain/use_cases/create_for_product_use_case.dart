import 'package:demo_app/features/stock/domain/entities/create_for_product_entity.dart';

import '../../../../core/errors/unauthenticated_failure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../repositories/i_stock_repository.dart';

class CreateForProductUseCase{
  final IStockRepository _repository;
  final ILoginRepository _loginRepository;

  CreateForProductUseCase(this._repository, this._loginRepository);

  Future<void> call(CreateForProductEntity entity) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailure('Unauthenticated');
    final insertedId = _repository.createForProduct(entity, token);
    return null;
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
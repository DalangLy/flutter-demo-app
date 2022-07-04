import 'package:demo_app/features/stock/domain/repositories/i_stock_repository.dart';

import '../../../../core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../entities/create_stock_entity.dart';

class CreateStockUseCase{
  final IStockRepository _repository;
  final ILoginRepository _loginRepository;

  CreateStockUseCase(this._repository, this._loginRepository);

  Future<void> call(CreateStockEntity stock) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailed('Unauthenticated');
    final insertedId = _repository.create(stock, token);
    return null;
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
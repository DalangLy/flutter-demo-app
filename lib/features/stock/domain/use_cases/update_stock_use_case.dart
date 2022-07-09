import '../../../../core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../../data/models/update_stock_model.dart';
import '../entities/update_stock_entity.dart';
import '../repositories/i_stock_repository.dart';

class UpdateStockUseCase{
  final IStockRepository _repository;
  final ILoginRepository _loginRepository;

  UpdateStockUseCase(this._repository, this._loginRepository);

  Future<void> call(UpdateStockEntity entity) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailed('Unauthenticated');
    final updatedId = _repository.update(UpdateStockModel.fromEntity(entity), token);
    return null;
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
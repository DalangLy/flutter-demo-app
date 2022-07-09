import '../../../../core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../../data/models/transfer_stock_model.dart';
import '../entities/transfer_stock_entity.dart';
import '../repositories/i_stock_repository.dart';

class TransferStockUseCase{
  final IStockRepository _repository;
  final ILoginRepository _loginRepository;

  TransferStockUseCase(this._repository, this._loginRepository);

  Future<void> call(TransferStockEntity entity) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailed('Unauthenticated');
    final updatedId = _repository.transfer(TransferStockModel.fromEntity(entity), token);
    return null;
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
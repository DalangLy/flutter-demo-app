import '../../../../core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../entities/stock_entity.dart';
import '../repositories/i_stock_repository.dart';

class GetStockByWareIdUseCase{
  final IStockRepository _repository;
  final ILoginRepository _loginRepository;

  GetStockByWareIdUseCase(this._repository, this._loginRepository);

  Future<StockEntity> call(String id) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailed('Unauthenticated');
    return await _repository.getByWare(id, token);
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
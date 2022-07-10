import '../../../../core/errors/unauthenticated_failure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../entities/stock_entity.dart';
import '../repositories/i_stock_repository.dart';

class GetAllStocksUseCase{
  final IStockRepository _repository;
  final ILoginRepository _loginRepository;

  GetAllStocksUseCase(this._repository, this._loginRepository);

  Future<List<StockEntity>> call() async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailure('Unauthenticated');
    return _repository.getAll(token);
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
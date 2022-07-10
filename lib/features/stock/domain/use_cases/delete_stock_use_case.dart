import 'package:demo_app/features/stock/domain/repositories/i_stock_repository.dart';
import '../../../../core/errors/unauthenticated_failure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';

class DeleteStockUseCase{
  final IStockRepository _repository;
  final ILoginRepository _loginRepository;

  DeleteStockUseCase(this._repository, this._loginRepository,);

  Future<void> call(String id) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailure('Unauthenticated');
    String insertedId = await _repository.delete(id, token);
    return null;
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
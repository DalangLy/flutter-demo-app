import '../../../../core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../entities/ware_entity.dart';
import '../repositories/i_ware_repository.dart';

class GetAllWaresUseCase{
  final IWareRepository _repository;
  final ILoginRepository _loginRepository;

  GetAllWaresUseCase(this._repository, this._loginRepository,);

  Future<List<WareEntity>> call() async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailed('Unauthenticated');
    return _repository.getAll(token);
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
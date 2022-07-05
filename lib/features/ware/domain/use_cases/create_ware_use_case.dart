import '../../../../core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../entities/create_ware_entity.dart';
import '../repositories/i_ware_repository.dart';

class CreateWareUseCase{
  final IWareRepository _repository;
  final ILoginRepository _loginRepository;

  CreateWareUseCase(this._repository, this._loginRepository);

  Future<void> call(CreateWareEntity product) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailed('Unauthenticated');
    final insertedId = _repository.create(product, token);
    return null;
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
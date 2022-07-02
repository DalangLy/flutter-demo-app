import '../entities/ware.dart';
import '../repositories/i_ware_repository.dart';

class GetAllWaresUseCase{
  final IWareRepository _repository;

  GetAllWaresUseCase(this._repository);

  Future<List<Ware>> call(){
    return _repository.getAll();
  }
}
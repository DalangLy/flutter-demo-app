import 'package:demo_app/core/errors/failure.dart';
import 'package:demo_app/features/login/domain/repositories/i_login_repository.dart';
import 'package:demo_app/features/product/domain/repositories/i_product_repository.dart';

import '../../../../core/errors/unauthenticated_failure.dart';
import '../entities/create_product_entity.dart';

class CreateProductUseCase{
  final IProductRepository _repository;
  final ILoginRepository _loginRepository;

  CreateProductUseCase(this._repository, this._loginRepository);

  Future<void> call(CreateProductEntity product) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailure('Unauthenticated');
    try{
      final insertedId = _repository.create(product, token);
      return null;
    }
    on Failure{
      rethrow;
    }catch(e){
      throw Exception(e);
    }
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}
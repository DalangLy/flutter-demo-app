import 'package:bloc/bloc.dart';
import 'package:demo_app/core/errors/failure.dart';
import 'package:demo_app/core/errors/unauthenticated_failure.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/create_product_entity.dart';
import '../../../domain/use_cases/create_product_use_case.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final CreateProductUseCase _createProductUseCase;
  CreateProductBloc(this._createProductUseCase,) : super(CreateProductInitial()) {
    on<CreateProductEvent>((event, emit) async{
      if(event is CreateProduct){
        try{
          emit(CreateProductInProgress());
          final result = await _createProductUseCase(event.createProduct);
          emit(CreateProductSuccess());
        }
        on Failure catch(e){
          if(e is UnauthenticatedFailure){
            emit(UnAuthorized());
          }
        }
        catch(e){
          emit(const CreateProductFailed('message '));
        }
      }
    });
  }

  void create(CreateProductEntity create){
    add(CreateProduct(create));
  }
}

import 'package:bloc/bloc.dart';
import 'package:demo_app/features/stock/domain/entities/create_for_product_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/create_for_product_entity.dart';
import '../../../domain/use_cases/create_for_product_use_case.dart';

part 'create_for_product_event.dart';
part 'create_for_product_state.dart';

class CreateForProductBloc extends Bloc<CreateForProductEvent, CreateForProductState> {
  final CreateForProductUseCase _createForProductUseCase;
  CreateForProductBloc(this._createForProductUseCase) : super(CreateForProductInitial()) {
    on<CreateForProductEvent>((event, emit) async{
      if(event is CreateForProduct){
        try{
          emit(CreateForProductInProgress());
          final result = await _createForProductUseCase(event.createEntity);
          emit(CreateForProductSuccess());
        }catch(e){
          emit(const CreateForProductFailed('message '));
        }
      }
    });
  }

  void createForProduct(CreateForProductEntity createEntity){
    add(CreateForProduct(createEntity));
  }
}

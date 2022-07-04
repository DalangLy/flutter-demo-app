import 'package:bloc/bloc.dart';
import 'package:demo_app/features/product/domain/entities/update_product_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/update_product_use_case.dart';

part 'update_product_event.dart';
part 'update_product_state.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  final UpdateProductUseCase _updateProductUseCase;
  UpdateProductBloc(this._updateProductUseCase) : super(UpdateProductInitial()) {
    on<UpdateProductEvent>((event, emit) async{
      if(event is UpdateProduct){
        try{
          emit(UpdateProductInProgress());
          await _updateProductUseCase(event.updateProduct);
          emit(UpdateProductSuccess());
        }catch(e){
          emit(const UpdateProductFailed('message'));
        }
      }
    });
  }

  void update(UpdateProductEntity product){
    add(UpdateProduct(product));
  }
}

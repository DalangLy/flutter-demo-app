import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/delete_product_use_case.dart';

part 'delete_product_event.dart';
part 'delete_product_state.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  final DeleteProductUseCase _deleteProductUseCase;
  DeleteProductBloc(this._deleteProductUseCase) : super(DeleteProductInitial()) {
    on<DeleteProductEvent>((event, emit) async{
      if(event is DeleteProduct){
        try{
          emit(DeleteProductInProgress());
          await _deleteProductUseCase(event.id);
          emit(DeleteProductSuccess());
        }catch(e){
          emit(const DeleteProductFailed('message'));
        }
      }
    });
  }

  void delete(String id){
    add(DeleteProduct(id));
  }
}

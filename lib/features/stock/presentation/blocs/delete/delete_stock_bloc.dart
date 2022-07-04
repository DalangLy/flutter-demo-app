import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/delete_stock_use_case.dart';

part 'delete_stock_event.dart';
part 'delete_stock_state.dart';

class DeleteStockBloc extends Bloc<DeleteStockEvent, DeleteStockState> {
  final DeleteStockUseCase _deleteStockUseCase;
  DeleteStockBloc(this._deleteStockUseCase) : super(DeleteStockInitial()) {
    on<DeleteStockEvent>((event, emit) async{
      if(event is DeleteStock){
        try{
          emit(DeleteStockInProgress());
          await _deleteStockUseCase(event.id);
          emit(DeleteStockSuccess());
        }catch(e){
          emit(const DeleteStockFailed('message'));
        }
      }
    });
  }

  void delete(String id){
    add(DeleteStock(id));
  }
}

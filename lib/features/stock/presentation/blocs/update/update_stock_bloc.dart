import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/update_stock_entity.dart';
import '../../../domain/use_cases/update_stock_use_case.dart';

part 'update_stock_event.dart';
part 'update_stock_state.dart';

class UpdateStockBloc extends Bloc<UpdateStockEvent, UpdateStockState> {
  final UpdateStockUseCase _updateStockUseCase;
  UpdateStockBloc(this._updateStockUseCase) : super(UpdateStockInitial()) {
    on<UpdateStockEvent>((event, emit) async{
      if(event is UpdateStock){
        try{
          emit(UpdateStockInProgress());
          await _updateStockUseCase(event.updateEntity);
          emit(UpdateStockSuccess());
        }catch(e){
          emit(const UpdateStockFailed('message'));
        }
      }
    });
  }

  void update(UpdateStockEntity updateEntity){
    add(UpdateStock(updateEntity));
  }
}

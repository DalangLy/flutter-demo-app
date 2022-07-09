import 'package:bloc/bloc.dart';
import 'package:demo_app/features/stock/domain/entities/create_stock_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/create_stock_use_case.dart';

part 'create_stock_event.dart';
part 'create_stock_state.dart';

class CreateStockBloc extends Bloc<CreateStockEvent, CreateStockState> {
  final CreateStockUseCase _createStockUseCase;
  CreateStockBloc(this._createStockUseCase,) : super(CreateStockInitial()) {
    on<CreateStockEvent>((event, emit) async{
      if(event is CreateStock){
        try{
          emit(CreateStockInProgress());
          final result = await _createStockUseCase(event.createEntity);
          emit(CreateStockSuccess());
        }catch(e){
          emit(const CreateStockFailed('message '));
        }
      }
    });
  }

  void createStock(CreateStockEntity createEntity){
    add(CreateStock(createEntity));
  }
}

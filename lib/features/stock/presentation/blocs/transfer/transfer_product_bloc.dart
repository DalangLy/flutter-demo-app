import 'package:bloc/bloc.dart';
import 'package:demo_app/features/stock/domain/entities/transfer_stock_entity.dart';
import 'package:demo_app/features/stock/domain/use_cases/transfer_stock_use_case.dart';
import 'package:equatable/equatable.dart';

part 'transfer_product_event.dart';
part 'transfer_product_state.dart';

class TransferProductBloc extends Bloc<TransferProductEvent, TransferProductState> {
  final TransferStockUseCase _transferStockUseCase;
  TransferProductBloc(this._transferStockUseCase) : super(TransferProductInitial()) {
    on<TransferProductEvent>((event, emit) async{
      if(event is TransferProduct){
        try{
          emit(TransferProductInProgress());
          final result = await _transferStockUseCase(event._entity);
          emit(TransferProductSuccess());
        }catch(e){
          emit(const TransferProductFailed('message '));
        }
      }
    });
  }

  void transferProduct(TransferStockEntity entity){
    add(TransferProduct(entity));
  }
}

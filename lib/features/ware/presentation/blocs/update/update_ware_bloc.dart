import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/update_ware_entity.dart';
import '../../../domain/use_cases/update_ware_use_case.dart';

part 'update_ware_event.dart';
part 'update_ware_state.dart';

class UpdateWareBloc extends Bloc<UpdateWareEvent, UpdateWareState> {
  final UpdateWareUseCase _updateWareUseCase;
  UpdateWareBloc(this._updateWareUseCase) : super(UpdateWareInitial()) {
    on<UpdateWareEvent>((event, emit) async{
      if(event is UpdateWare){
        try{
          emit(UpdateWareInProgress());
          await _updateWareUseCase(event.updateEntity);
          emit(UpdateWareSuccess());
        }catch(e){
          emit(const UpdateWareFailed('message'));
        }
      }
    });
  }

  void update(UpdateWareEntity updateEntity){
    add(UpdateWare(updateEntity));
  }
}

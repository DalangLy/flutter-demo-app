import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/use_cases/delete_ware_use_case.dart';

part 'delete_ware_event.dart';
part 'delete_ware_state.dart';

class DeleteWareBloc extends Bloc<DeleteWareEvent, DeleteWareState> {
  final DeleteWareUseCase _deleteWareUseCase;
  DeleteWareBloc(this._deleteWareUseCase) : super(DeleteWareInitial()) {
    on<DeleteWareEvent>((event, emit) async{
      if(event is DeleteWare){
        try{
          emit(DeleteWareInProgress());
          await _deleteWareUseCase(event.id);
          emit(DeleteWareSuccess());
        }catch(e){
          emit(const DeleteWareFailed('message'));
        }
      }
    });
  }

  void delete(String id){
    add(DeleteWare(id));
  }
}

import 'package:bloc/bloc.dart';
import 'package:demo_app/features/ware/domain/entities/create_ware_entity.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/use_cases/create_ware_use_case.dart';

part 'create_ware_event.dart';
part 'create_ware_state.dart';

class CreateWareBloc extends Bloc<CreateWareEvent, CreateWareState> {
  final CreateWareUseCase _createWareUseCase;
  CreateWareBloc(this._createWareUseCase) : super(CreateWareInitial()) {
    on<CreateWareEvent>((event, emit) async{
      if(event is CreateWare){
        try{
          emit(CreateWareInProgress());
          final result = await _createWareUseCase(event.createEntity);
          emit(CreateWareSuccess());
        }catch(e){
          emit(const CreateWareFailed('message '));
        }
      }
    });
  }

  void create(CreateWareEntity createWareEntity){
    add(CreateWare(createWareEntity));
  }
}

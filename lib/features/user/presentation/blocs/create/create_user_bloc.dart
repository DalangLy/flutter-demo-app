import 'package:bloc/bloc.dart';
import 'package:demo_app/features/user/domain/entities/create_user_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/create_user_use_case.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  final CreateUserUseCase _createUserUseCase;
  CreateUserBloc(this._createUserUseCase) : super(CreateUserInitial()) {
    on<CreateUserEvent>((event, emit) async{
      if(event is CreateUser){
        try{
          emit(CreateUserInProgress());
          final result = await _createUserUseCase(event.createEntity);
          emit(CreateUserSuccess());
        }catch(e){
          emit(const CreateUserFailed('message '));
        }
      }
    });
  }

  void create(CreateUserEntity create){
    add(CreateUser(create));
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/login.dart';
import '../../../domain/use_cases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async{
      if(event is StartLogin){
        emit(const LoginInProgress());
        try{
          await _loginUseCase(event.login);
          emit(const LoginSuccess());
        }
        catch(e){
          emit(const LoginFailed('Login Failed'));
        }
      }
    });
  }

  void login(Login login){
    add(StartLogin(login));
  }
}

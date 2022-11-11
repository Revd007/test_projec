import 'package:bloc/bloc.dart';
import 'LoginEvent.dart';
import 'LoginState.dart';

class LoginBloc extends Bloc<LoginEvent , LoginState> {
  LoginBloc():
        super(LoginInitial());
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is LoginWithEmailPassword){
      yield* mapLoginWithEmailPassword(event);
    } else if(event is LogoutAccount){
      yield* logoutState(event);
    } else if(event is LoginForgot){
      yield* mapForgotPassword(event);
    }
  }
  Stream<LoginState> logoutState(LogoutAccount state) async* {

    yield Logout();
  }
  Stream<LoginState> mapForgotPassword(LoginForgot event) async* {
    yield ForgotLoading();
    try {
      yield ForgotSuccess();
    } catch (e){
      yield ForgotFailure(error : 'Error in apps');
    }
  }
  Stream<LoginState> mapLoginWithEmailPassword(LoginWithEmailPassword event) async* {
    yield LoginLoading();
    try {
      yield LoginSuccess();
    } catch (e) {
      print(e);
      yield LoginFailure(error : 'Error in apps');
    }
  }
}
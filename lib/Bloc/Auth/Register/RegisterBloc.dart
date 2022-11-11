import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:test_project/Bloc/Auth/Register/RegisterEvent.dart';
import 'package:test_project/Bloc/Auth/Register/RegisterState.dart';

class RegisterBloc extends Bloc<RegisterEvent , RegisterState> {
  RegisterBloc() : super(RegisterInitial());
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if(event is RegisterWithData){
      yield* registerWithData(event);
    }
  }
  Stream<RegisterState> registerWithData(RegisterWithData event) async* {
    yield RegisterLoading();
    try {
      yield RegisterSuccess();
    } catch (e) {
      print(e);
      yield RegisterFailure(error : 'Error');
    }
  }
}
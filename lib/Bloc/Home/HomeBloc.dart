import 'package:bloc/bloc.dart';
import 'HomeEvent.dart';
import 'HomeState.dart';

class HomeBloc extends Bloc<HomeEvent , HomeState> {
  HomeBloc():
        super(HomeInitial());
  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is HomeSuccess){
      yield* homeSuccess(event);
    }
  }
  Stream<HomeState> homeSuccess(HomeEvent event) async* {
    yield HomeSuccess();
  }
}
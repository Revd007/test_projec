import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeData extends HomeEvent {
  HomeData();
  @override
  List<Object> get props => [  ];
}

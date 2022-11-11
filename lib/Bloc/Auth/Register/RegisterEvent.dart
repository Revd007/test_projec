import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/Bloc/Models/RegisterData.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterWithData extends RegisterEvent {
  final RegisterData model;
  RegisterWithData({required this.model});
  @override
  List<Object> get props => [ model ];
}
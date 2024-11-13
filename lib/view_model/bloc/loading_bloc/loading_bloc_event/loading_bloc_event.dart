



import 'package:equatable/equatable.dart';

abstract class LoadingBlocEvent extends Equatable{


  @override
  List<Object?> get props => [];

}

class SetLoading extends LoadingBlocEvent {}




import 'package:equatable/equatable.dart';

class LoadingBlocState extends Equatable {

  final bool isLoading;

  LoadingBlocState({this.isLoading = false});


  LoadingBlocState copyWith({bool? isLoading}) {
    return LoadingBlocState(isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [isLoading];
}
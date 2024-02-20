part of 'adviser_bloc.dart';

abstract class AdviserState extends Equatable{}

class AdviserInitial extends AdviserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AdviserStateLoading extends AdviserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AdviserStateLoaded extends AdviserState {
  final String advice;
  AdviserStateLoaded(this.advice);

  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class AdviserStateError extends AdviserState {
  final String errorMessage;
  AdviserStateError(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

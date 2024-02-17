part of 'adviser_bloc.dart';

abstract class AdviserState {}

class AdviserInitial extends AdviserState {}

class AdviserStateLoading extends AdviserState {}

class AdviserStateLoaded extends AdviserState {
  final String advice;
  AdviserStateLoaded(this.advice);
}

class AdviserStateError extends AdviserState {
  final String errorMessage;
  AdviserStateError(this.errorMessage);
}

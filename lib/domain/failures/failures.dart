import 'package:equatable/equatable.dart';

abstract class Failures{}

class ServerFailure extends Failures with EquatableMixin{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CacheFailure extends Failures with EquatableMixin{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GeneralFailure extends Failures with EquatableMixin{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
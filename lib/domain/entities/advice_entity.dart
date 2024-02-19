import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  final String adviceMessage;
  final int id;

  AdviceEntity({required this.adviceMessage, required this.id});

  @override
  // TODO: implement props
  @override
  List<Object?> get props => [adviceMessage, id];
}

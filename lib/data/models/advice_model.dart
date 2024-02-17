import 'package:clean_architecture_app/domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({required String advice, required int id})
      : super(adviceMessage: advice, id: id);
  factory AdviceModel.fromJson(Map<String, dynamic> json){
    return AdviceModel(advice: json['advice'], id: json['advice_id']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

import 'package:clean_architecture_app/domain/entities/advice_entity.dart';

abstract class AdviceRepo{
  Future<AdviceEntity> getAdviceFromDataSource();
}
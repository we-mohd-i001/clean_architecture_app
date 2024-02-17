import 'package:clean_architecture_app/domain/entities/advice_entity.dart';
import 'package:clean_architecture_app/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdviceRepo{
  Future<Either<Failures, AdviceEntity>> getAdviceFromDataSource();
}
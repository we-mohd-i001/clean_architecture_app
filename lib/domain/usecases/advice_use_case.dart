import 'package:clean_architecture_app/domain/entities/advice_entity.dart';
import 'package:clean_architecture_app/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCase {
  Future<Either<Failures, AdviceEntity>> getAdvice() async {
    await Future.delayed(const Duration(seconds: 1));
    //return right(AdviceEntity(adviceMessage: 'Fake advice entity message!', id: 1));
    //or
    return left(ServerFailure());
  }
}

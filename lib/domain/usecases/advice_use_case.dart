import 'package:clean_architecture_app/data/repositories/advice_repo_impl.dart';
import 'package:clean_architecture_app/domain/entities/advice_entity.dart';
import 'package:clean_architecture_app/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCase {
  final adviceRepoImpl = AdviceRepoImpl();
  Future<Either<Failures, AdviceEntity>> getAdvice() async {
    return adviceRepoImpl.getAdviceFromDataSource();
    // await Future.delayed(const Duration(seconds: 1));
    // return right(AdviceEntity(adviceMessage: , id: 1));
    // //or
    // //return left(ServerFailure());
  }
}

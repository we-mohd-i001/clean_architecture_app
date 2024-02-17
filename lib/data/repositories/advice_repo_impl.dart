import 'package:clean_architecture_app/data/data_resource/advice_remote_data_resource.dart';
import 'package:clean_architecture_app/domain/entities/advice_entity.dart';
import 'package:clean_architecture_app/domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture_app/domain/failures/failures.dart';

class AdviceRepoImpl implements AdviceRepo{
  final AdviceRemoteDataResource adviceRemoteDataResource = AdviceRemoteDataResourceImpl();

  @override
  Future<Either<Failures, AdviceEntity>> getAdviceFromDataSource() async {
    final result = await adviceRemoteDataResource.getRandomAdviceFromApi();
    return right(result);
  }

}
import 'package:clean_architecture_app/application/pages/advice/bloc/adviser_bloc.dart';
import 'package:clean_architecture_app/data/datasources/advice_remote_data_resource.dart';
import 'package:clean_architecture_app/data/repositories/advice_repo_impl.dart';
import 'package:clean_architecture_app/domain/repositories/advice_repo.dart';
import 'package:clean_architecture_app/domain/usecases/advice_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I;

Future<void> init() async {
  // ! Application layer
  sl.registerFactory(() => AdviserBloc(adviceUseCase: sl()));

  // ! Domain layer
  sl.registerFactory(() => AdviceUseCase(adviceRepoImpl: sl()));

  // ! Data layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDataResource: sl()));
  sl.registerFactory<AdviceRemoteDataResource>(
      () => AdviceRemoteDataResourceImpl(client: sl()));

  // externs

  sl.registerFactory(() => http.Client());
}

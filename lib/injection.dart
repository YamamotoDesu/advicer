import 'package:advicer/0_data/datasources/advice_remote_datasource.dart';
import 'package:advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:advicer/1_domain/repositories/advice_repo.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:advicer/2_application/pages/advice/cubit/advicer_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl // sl == Service Locator
    = GetIt
        .instance; // GetIt is a service locator that lets you retrieve objects using a type or a name.

Future<void> init() async {
  // ! application Layer
  sl.registerFactory(
    () => AdvicerCubit(
      adviceUseCases: sl(),
    ),
  );

  // ! domain Layer
  sl.registerFactory(
    () => AdviceUseCases(
      adviceRepo: sl(),
    ),
  );
  ;
  // ! data Layer
  sl.registerFactory<AdviceRepo>(
    () => AdviceRepoImpl(
      adviceRemoteDatasource: sl(),
    ),
  );
  sl.registerFactory<AdviceRemoteDatasource>(
    () => AdviceRemoteDatasourceImpl(
      client: sl(),
    ),
  );

  // ! externs
  sl.registerFactory(() => http.Client());
}

import 'package:Dinaro/convert/data/data_sources/convert_remote_data_source.dart';
import 'package:Dinaro/convert/data/data_sources/currency_local_data_source.dart';
import 'package:Dinaro/convert/data/repositories/convert_repository.dart';
import 'package:Dinaro/convert/domain/repositories/base_convert_repositorie.dart';
import 'package:Dinaro/convert/domain/usecases/convert_useCase.dart';
import 'package:Dinaro/convert/domain/usecases/get_currency_useCase.dart';
import 'package:Dinaro/core/connection/network_info.dart';
import 'package:Dinaro/core/databases/api/dio_consumer.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // uses Cases
    sl.registerLazySingleton(() => ConvertUsecase(repositorie: sl()));
    sl.registerLazySingleton(() => GetCurrencyUsecase(repositorie: sl()));
    // repositorys
    sl.registerLazySingleton<BaseConvertRepositorie>(
      () => ConvertRepository(
        remoteDataSource: sl(),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        localDataSource: sl(),
      ),
    );
    // data source
    sl.registerLazySingleton(() => ConvertRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())));
    sl.registerLazySingleton(() => CurrencyLocalDataSource());

  }
}

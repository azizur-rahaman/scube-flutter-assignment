import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/network/network_info.dart';

import 'features/monitoring/data/datasources/monitoring_local_data_source.dart';
import 'features/monitoring/data/repositories/monitoring_repository_impl.dart';
import 'features/monitoring/domain/repositories/monitoring_repository.dart';
import 'features/monitoring/domain/usecases/get_monitoring_data.dart';
import 'features/monitoring/presentation/bloc/monitoring_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! Features - Monitoring
  sl.registerFactory(() => MonitoringBloc(getMonitoringData: sl()));
  sl.registerLazySingleton(() => GetMonitoringData(sl()));
  sl.registerLazySingleton<MonitoringRepository>(
    () => MonitoringRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingleton<MonitoringLocalDataSource>(
    () => MonitoringLocalDataSourceImpl(),
  );

  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
}

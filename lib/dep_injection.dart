
import 'package:app_weather/data/data_source/remote/remote_datasource_abst.dart';
import 'package:app_weather/data/data_source/remote/remote_datasource_impl.dart';
import 'package:app_weather/data/repository/repository_impl.dart';
import 'package:app_weather/domain/repository.dart';
import 'package:app_weather/domain/usecase.dart';
import 'package:app_weather/presentation/bloc/weather_forecast/forecast_bloc.dart';
import 'package:app_weather/presentation/bloc/weather_today/weather_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

import 'core/network/netword_info.dart';
import 'data/data_source/remote/services/weather_api_service.dart';

final sl = GetIt.instance;

void init(){

  //bloc
  sl.registerFactory<ForecastBloc>(() => ForecastBloc(useCase: sl()));
  sl.registerFactory<WeatherBloc>(() => WeatherBloc(useCase: sl()));

  //usecase
  sl.registerLazySingleton(() => WeatherUseCase(weatherRepo: sl(), networkInfo: sl()));

  //repo
  sl.registerLazySingleton<WeatherRepoAbst>(() => WeatherRepoImpl(remoteData: sl()));
  
  //dataSource
  sl.registerLazySingleton<WeatherRemoteDataAbst>(() => WeatherRemoteDataImpl(service: sl()));
  sl.registerLazySingleton<WeatherService>(() => WeatherService.create());

  //network
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(dataConnectionChecker: sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());

}
import 'package:app_weather/core/error/exception_handler.dart';
import 'package:app_weather/core/error/failure.dart';
import 'package:app_weather/data/data_source/remote_datasource_abst.dart';
import 'package:app_weather/domain/repository.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class WeatherRepoImpl extends WeatherRepoAbst {
  final WeatherRemoteDataAbst remoteData;

  WeatherRepoImpl({@required this.remoteData});

  @override
  Future<Either<Failure, WeatherEntity>> getWeather(String cityName) async {
    try {
      return Right(await remoteData.getWeather(cityName));
    } catch (e) {
      print(e.statusCode);

      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<WeatherEntity>>> getForecast(
      String cityName) async {
    try {
      return Right(await remoteData.getForecast(cityName));
    } catch (e) {
      print(e.statusCode);
      return Left(ExceptionToFailure.handle(e));
    }
  }
}

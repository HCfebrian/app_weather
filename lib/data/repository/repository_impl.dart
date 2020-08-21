import 'package:app_weather/core/error/exception_handler.dart';
import 'package:app_weather/core/error/failure.dart';
import 'package:app_weather/data/data_source/local/weather_local_source.dart';
import 'package:app_weather/data/data_source/remote/remote_datasource_abst.dart';
import 'package:app_weather/domain/repository.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class WeatherRepoImpl extends WeatherRepoAbst {
  final WeatherRemoteDataAbst remoteData;
  final LocalSourceAbst localSourceAbst;

  WeatherRepoImpl({@required this.remoteData, @required this.localSourceAbst });

  @override
  Future<Either<Failure, WeatherEntity>> getWeather(String cityName) async {
    try {
      final weatherToday = await remoteData.getWeather(cityName);
      return Right(weatherToday);
    } catch (e) {
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<WeatherEntity>>> getForecast(
      String cityName) async {
    try {
      final forecastWeather = await remoteData.getForecast(cityName);
      return Right(forecastWeather);
    } catch (e) {
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  List<WeatherEntity> getSavedForecast() {
    return localSourceAbst.getSavedForecast();
  }

  @override
  WeatherEntity getSavedWeather() {
    return localSourceAbst.getSavedWeather();
  }
}

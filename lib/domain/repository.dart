import 'package:app_weather/domain/weather_entity.dart';
import 'package:app_weather/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepoAbst{
  Future<Either<Failure, WeatherEntity>> getWeather(String cityName);
  Future<Either<Failure, List<WeatherEntity>>> getForecast(String cityName);
}
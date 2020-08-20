import 'package:app_weather/domain/repository.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:app_weather/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class WeatherUseCase{
  final WeatherRepoAbst weatherRepo;
  WeatherUseCase({@required this.weatherRepo});

  Future<Either<Failure, WeatherEntity>> getWeather(String cityName) async{
    return await weatherRepo.getWeather(cityName);
  }

  Future<Either<Failure, List<WeatherEntity>>> getForecast(String cityName) async{
    return await weatherRepo.getForecast(cityName);
  }

}
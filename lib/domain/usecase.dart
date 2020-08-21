import 'package:app_weather/core/network/netword_info.dart';
import 'package:app_weather/domain/repository.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:app_weather/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class WeatherUseCase{
  final WeatherRepoAbst weatherRepo;
  final NetworkInfo networkInfo;
  WeatherUseCase( {@required this.weatherRepo, @required this.networkInfo});

  Future<Either<Failure, WeatherEntity>> getWeather(String cityName) async{
    if(! await networkInfo.isConnected) return Left(NetworkFailure());
    return await weatherRepo.getWeather(cityName);
  }

  Future<Either<Failure, List<WeatherEntity>>> getForecast(String cityName) async{
    if(! await networkInfo.isConnected) return Left(NetworkFailure());
    return await weatherRepo.getForecast(cityName);
  }

  WeatherEntity getSavedWeather(){
    return weatherRepo.getSavedWeather();
  }
  List<WeatherEntity> getSavedForecast(){
    return weatherRepo.getSavedForecast();
  }




}
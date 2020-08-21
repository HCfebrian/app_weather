import 'package:app_weather/domain/weather_entity.dart';

abstract class WeatherRemoteDataAbst {
  Future<WeatherEntity> getWeather(String cityName);
  Future<List<WeatherEntity>> getForecast(String cityName);


}
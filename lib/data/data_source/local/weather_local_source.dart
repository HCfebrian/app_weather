import 'package:app_weather/domain/weather_entity.dart';

abstract class LocalSourceAbst{
  WeatherEntity getSavedWeather();
  List<WeatherEntity> getSavedForecast();
  void saveWeather(WeatherEntity weatherEntity);
  void saveForecast(List<WeatherEntity> listForecast);
}
import 'package:app_weather/core/value/static.dart';
import 'package:app_weather/data/data_source/local/weather_local_source.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:hive/hive.dart';

class LocalSourceImpl extends LocalSourceAbst{
  @override
  List<WeatherEntity> getSavedForecast() {
    final weatherBox = Hive.box(Static.WEATHER_BOX);

    return weatherBox.get(Static.WEATHER_FORECAST);
  }

  @override
  WeatherEntity getSavedWeather() {
    final weatherBox = Hive.box(Static.WEATHER_BOX);

    return weatherBox.get(Static.WEATHER_TODAY);
  }

  @override
  void saveForecast(List<WeatherEntity> listForecast) {
    final weatherBox = Hive.box(Static.WEATHER_BOX);

    weatherBox.put(Static.WEATHER_FORECAST, listForecast);
  }

  @override
  void saveWeather(WeatherEntity weatherEntity) {
    final weatherBox = Hive.box(Static.WEATHER_BOX);
    weatherBox.put(Static.WEATHER_TODAY, weatherEntity);
  }


}
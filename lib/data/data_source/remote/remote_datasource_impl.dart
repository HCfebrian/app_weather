import 'dart:convert';

import 'package:app_weather/core/error/exception.dart';
import 'package:app_weather/data/data_source/remote/remote_datasource_abst.dart';
import 'package:app_weather/data/data_source/remote/services/weather_api_service.dart';
import 'package:app_weather/data/model/weather_model.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:meta/meta.dart';

class WeatherRemoteDataImpl extends WeatherRemoteDataAbst {
  final WeatherService service;

  WeatherRemoteDataImpl({@required this.service});

  @override
  Future<List<WeatherEntity>> getForecast(String cityName) async {
    final forecast = await service.getForecast(cityName);

    if (forecast.statusCode != 200) {
      throw GetDataException(forecast.statusCode, "Unable to get data weather");
    }

    if (forecast.isSuccessful) {
      final weathers = json.decode(forecast.bodyString);
      List<WeatherModel> listForecast = [];

      for (int index = 0; index < 40; index++) {
        listForecast.add(WeatherModel.forecast(weathers, index));
      }

      return listForecast;
    }
  }

  @override
  Future<WeatherEntity> getWeather(String cityName) async {
    final weather = await service.getWeather(cityName);

    if (weather.statusCode != 200) {
      throw GetDataException(weather.statusCode, "Unable to get data weather");
    }

    if (weather.isSuccessful) {
      return WeatherModel.today(weather.body);
    }
  }
}

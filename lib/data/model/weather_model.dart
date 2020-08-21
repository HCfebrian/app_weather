import 'package:app_weather/domain/weather_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';


class WeatherModel extends WeatherEntity {
  WeatherModel({
    @required String name,
    @required String icon,
    @required String description,
    @required temp,
    @required humidity,
    @required visibility,
    @required windSpeed,
    @required DateTime dt,
  }) : super(
          name: name,
          icon: icon,
          description: description,
          temp: temp,
          humidity: humidity,
          visibility: visibility,
          windSpeed: windSpeed,
          dt: dt,
        );

  factory WeatherModel.today(Map<String, dynamic> weather) {
    return WeatherModel(
        name: weather["name"],
        icon: weather["weather"][0]["icon"],
        description: weather["weather"][0]["description"],
        temp: weather["main"]["temp"],
        humidity: weather["main"]["humidity"],
        visibility: weather["visibility"],
        windSpeed: weather["wind"]["speed"],
        dt: new DateTime.fromMillisecondsSinceEpoch(weather["dt"] * 1000));
  }

  factory WeatherModel.forecast(Map<String, dynamic> weather, int index) {
    return WeatherModel(
        name: weather["city"]["name"],
        icon: weather["list"][index]["weather"][0]["icon"],
        description: weather["list"][index]["weather"][0]["description"],
        temp: weather["list"][index]["main"]["temp"],
        humidity: weather["list"][index]["main"]["humidity"],
        visibility: weather["list"][index]["visibility"],
        windSpeed: weather["list"][index]["wind"]["speed"],
        dt: new DateTime.fromMillisecondsSinceEpoch(
            weather["list"][index]["dt"] * 1000));
  }
}

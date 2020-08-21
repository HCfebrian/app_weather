// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$WeatherService extends WeatherService {
  _$WeatherService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = WeatherService;

  Future<Response> getWeather(String cityName) {
    final $url =
        '/data/2.5/weather?q=${cityName}&appid=aaeb23fa10a2eb31d102b161dfeaae5b&units=metric';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getForecast(String cityName) {
    final $url =
        '/data/2.5/forecast?q=${cityName}&appid=aaeb23fa10a2eb31d102b161dfeaae5b&units=metric';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}

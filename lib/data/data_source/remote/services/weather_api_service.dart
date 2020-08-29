import 'package:app_weather/core/value/static.dart';
import 'package:chopper/chopper.dart';

part 'weather_api_service.chopper.dart';

@ChopperApi(baseUrl: "/data/2.5/")
abstract class WeatherService extends ChopperService {
  @Get(
    path: 'weather?q={cityName}&units=metric&appid=${Static.APIKEY}',
  )
  Future<Response> getWeather(@Path('cityName') String cityName);

  @Get(path: 'forecast?q={cityName}&units=metric&appid=${Static.APIKEY}')
  Future<Response> getForecast(@Path('cityName') String cityName);

  static WeatherService create() {
    final client = ChopperClient(
        baseUrl: "http://api.openweathermap.org",
        services: [_$WeatherService()],
        converter: JsonConverter());
    return _$WeatherService(client);
  }
}

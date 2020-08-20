import 'package:app_weather/data/model/weather_model.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  final tModel = WeatherModel(name: "magelang", icon: "asd", description: "Sky Blue", temp: 33, humidity: 44, visibility: 8000, windSpeed: 200, dt: null);

  test(
      "should produce build entity form model",
      () async {
        //arrange

        //act
        //assert
        expect(tModel, isA<WeatherEntity>());
      },
    );
}
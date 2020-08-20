import 'package:app_weather/domain/repository.dart';
import 'package:app_weather/domain/usecase.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWeatherRepo extends Mock implements WeatherRepoAbst {}

void main() {
  WeatherUseCase useCase;
  MockWeatherRepo mockRepo;
  setUp(() {
    mockRepo = MockWeatherRepo();
    useCase = WeatherUseCase(weatherRepo: mockRepo);
  });

  final tCityName = "Magelang";
  final tWeather = WeatherEntity(
      name: "magelang",
      icon: "asd",
      description: "Blue Sky",
      temp: 30,
      humidity: 23,
      visibility: 3000,
      windSpeed: 222,
      dt: null);
  final tWeatherList = [tWeather, tWeather];

  group("test usecase", () {
    test(
      "should return WeatherEntity ",
      () async {
        //arrange
        when(mockRepo.getWeather(any))
            .thenAnswer((realInvocation) async => Right(tWeather));
        //act
        final result = await useCase.getWeather(tCityName);
        //assert
        expect(result, Right(tWeather));
      },
    );

    test(
      "should return list Weather Entity",
      () async {
        //arrange
        when(mockRepo.getForecast(any))
            .thenAnswer((realInvocation) async => Right(tWeatherList));
        //act
        final result = await useCase.getForecast(tCityName);
        //assert
        expect(result, Right(tWeatherList));
      },
    );


  });
}

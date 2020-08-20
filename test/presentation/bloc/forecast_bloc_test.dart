
import 'package:app_weather/domain/usecase.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:app_weather/presentation/bloc/weather_forecast/forecast_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUsecase extends Mock implements WeatherUseCase{}
void main(){
  MockUsecase usecaseMock;
  ForecastBloc bloc;
  setUp((){
    usecaseMock = MockUsecase();
    bloc = ForecastBloc(useCase: usecaseMock);
  });

  final tCityName = "magelang";
  final tWeather = WeatherEntity(name: "magelang", icon: "asd", description: "Blue Sky", temp: 30, humidity: 23, visibility: 3000, windSpeed: 222, dt: null);
  final tWeatherList = [tWeather,tWeather,tWeather,tWeather,tWeather,tWeather,];

  test(
      "should emit [loading, loaded] when list data is fetched successfully ",
      () async {
        //arrange
        when(usecaseMock.getForecast(any)).thenAnswer((realInvocation) async => Right(tWeatherList));
        //assert
        final expect= [
          ForecastLoading(),
          ForecastLoaded(forecastList: tWeatherList)
        ];
        expectLater(bloc, emitsInOrder(expect));
        //act
        bloc.add(GetForecast(cityName: tCityName));
        await untilCalled(usecaseMock.getForecast(any));
      },
    );
}
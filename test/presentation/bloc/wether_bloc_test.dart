import 'package:app_weather/domain/usecase.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:app_weather/presentation/bloc/weather_today/weather_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUseCase extends Mock implements WeatherUseCase{}
void main(){
  WeatherBloc bloc;
  MockUseCase useCase;
  setUp((){
    useCase = MockUseCase();
    bloc = WeatherBloc(useCase: useCase);
  });

  final tCity = "magelang";
  final tWeather = WeatherEntity(name: "magelang", icon: "dummy", description: "Blue Sky", temp: 20.2, humidity: 39, visibility: 8000, windSpeed: 300, dt: null);

  group("test getWeather usecase", (){
    test(
        "should emit [loading, Loaded] when data is fetched successfully",
        () async {
          //arrange
          when(useCase.getWeather(any)).thenAnswer((realInvocation) async => Right(tWeather));
          //assert letter
          final expected = [

            WeatherLoading(),
            WeatherLoaded(weatherEntity: tWeather)
          ];
          expectLater(bloc, emitsInOrder(expected));

          //act
          bloc.add(GetWeather(cityName: tCity));
          await untilCalled(useCase.getWeather(any));

        },
      );
    test(
        "should emit [loading error] when something goes wrong" ,
        () async {
          //arrange

          //act

          //assert
        },
      );
  });

}
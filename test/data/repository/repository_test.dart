import 'package:app_weather/data/data_source/local/weather_local_source.dart';
import 'package:app_weather/data/data_source/remote/remote_datasource_abst.dart';
import 'package:app_weather/data/repository/repository_impl.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteData extends Mock implements WeatherRemoteDataAbst{}
class MockLocalData extends Mock implements LocalSourceAbst{}
void main(){
  MockRemoteData mockRemoteData;
  MockLocalData mockLocalData;
  WeatherRepoImpl repoImpl;
  setUp((){
    mockLocalData = MockLocalData();
    mockRemoteData = MockRemoteData();
    repoImpl = WeatherRepoImpl(remoteData: mockRemoteData, localSourceAbst: mockLocalData);
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

  group("test remote data", (){
    test(
        "should get Weather entity",
        () async {
          //arrange
          when(mockRemoteData.getWeather(any)).thenAnswer((_) async => tWeather);
          //act
          final result = await repoImpl.getWeather(tCityName);
          //assert
          expect(result, equals(Right(tWeather)));
        },
      );
  });
}
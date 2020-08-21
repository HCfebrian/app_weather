import 'dart:async';

import 'package:app_weather/domain/usecase.dart';
import 'package:meta/meta.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUseCase useCase;

  WeatherBloc({@required this.useCase})
      : assert(useCase != null),
        super(Empty());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      yield WeatherLoading();
      final failureOrWeather = await useCase.getWeather(event.cityName);
      yield failureOrWeather.fold(
          (failure) => Error(failure.message), (weather) => WeatherLoaded(weatherEntity: weather));
    }

    if(event is GetSavedWeather) {
      yield WeatherLoading();
      final weatherToday =  useCase.getSavedWeather();
      print(weatherToday.icon);
      yield WeatherInitial(weatherToday);
    }
  }
}

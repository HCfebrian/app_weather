import 'dart:async';

import 'package:app_weather/domain/usecase.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final WeatherUseCase useCase;

  ForecastBloc({@required this.useCase})
      : assert(useCase != null),
        super(Empty());

  @override
  Stream<ForecastState> mapEventToState(
    ForecastEvent event,
  ) async* {
    if (event is GetForecast) {
      yield ForecastLoading();
      final failureOrForecast = await useCase.getForecast(event.cityName);
      yield failureOrForecast.fold(
              (failure) => ForecastError(), (forecast) => ForecastLoaded( forecastList: forecast));
    }

    if(event is GetSavedForecast){
      yield ForecastLoading();
      final forecast = useCase.getSavedForecast();
      yield ForecastInitial(forecast);
    }
  }
}

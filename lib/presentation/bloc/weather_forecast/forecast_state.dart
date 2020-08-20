part of 'forecast_bloc.dart';

@immutable
abstract class ForecastState extends Equatable{
  const ForecastState();
  @override
  List<Object> get props => [];
}

class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastLoaded extends ForecastState {
  final List<WeatherEntity> forecastList;

  ForecastLoaded({@required this.forecastList});

  @override
  List<Object> get props => [forecastList];
}

class ForecastError extends ForecastState {

}

part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class Empty extends WeatherState{}

class WeatherInitial extends WeatherState {
  final WeatherEntity weatherEntity;

  WeatherInitial(this.weatherEntity);

  @override
  List<Object> get props => super.props;
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntity weatherEntity;

  WeatherLoaded({ @required this.weatherEntity});
  @override
  List<Object> get props => [ weatherEntity];
}

class Error extends WeatherState{
  final message;

  Error(this.message);

  @override
  List<Object> get props => [message];

}

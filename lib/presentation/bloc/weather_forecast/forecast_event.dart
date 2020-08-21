part of 'forecast_bloc.dart';

@immutable
abstract class ForecastEvent extends Equatable{
  const ForecastEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetForecast extends ForecastEvent{
  final String cityName;

  GetForecast({@required this.cityName});
  @override
  List<Object> get props =>[cityName];

}

class GetSavedForecast extends ForecastEvent{

}

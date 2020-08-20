part of 'forecast_bloc.dart';

@immutable
abstract class ForecastEvent extends Equatable{
  const ForecastEvent();
}

class GetForecast extends ForecastEvent{
  final String cityName;

  GetForecast({@required this.cityName});
  @override
  List<Object> get props =>[cityName];

}

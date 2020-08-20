import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class WeatherEntity extends Equatable {
  final String name, icon, description;
  final  humidity, visibility, windSpeed, temp;
  final DateTime dt;

  WeatherEntity(
      {@required this.name,
      @required this.icon,
      @required this.description,
      @required this.temp,
      @required this.humidity,
      @required this.visibility,
      @required this.windSpeed,
      @required this.dt});

  @override
  List<Object> get props =>
      [name, icon, description, temp, humidity, visibility, windSpeed, dt];
}

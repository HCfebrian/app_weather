import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'weather_entity.g.dart';

@HiveType()
class WeatherEntity extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String icon;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final humidity;
  @HiveField(4)
  final visibility;
  @HiveField(5)
  final windSpeed;
  @HiveField(6)
  final temp;
  @HiveField(7)
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

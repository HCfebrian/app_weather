// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherEntityAdapter extends TypeAdapter<WeatherEntity> {
  @override
  WeatherEntity read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherEntity(
      name: fields[0] as String,
      icon: fields[1] as String,
      description: fields[2] as String,
      temp: fields[6] as dynamic,
      humidity: fields[3] as dynamic,
      visibility: fields[4] as dynamic,
      windSpeed: fields[5] as dynamic,
      dt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.humidity)
      ..writeByte(4)
      ..write(obj.visibility)
      ..writeByte(5)
      ..write(obj.windSpeed)
      ..writeByte(6)
      ..write(obj.temp)
      ..writeByte(7)
      ..write(obj.dt);
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;
}

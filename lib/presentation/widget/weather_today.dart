import 'package:app_weather/presentation/bloc/weather_today/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'horizontal_part_tile_widget.dart';

class WeatherToday extends StatelessWidget {
  const WeatherToday({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (BuildContext context, WeatherState state) {
        if (state is WeatherLoaded) {
          return HorizontalTile(weatherEntity: state.weatherEntity);
        }
        if (state is WeatherLoading) {
          return (Text("loading"));
        }
        if (state is Error) {
          return Text(state.message.toString());
        }
        if (state is WeatherInitial) {
          return HorizontalTile(
            weatherEntity: state.weatherEntity,
          );
        }
        return (Text("Empty"));
      },
    );
  }
}

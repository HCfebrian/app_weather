import 'package:app_weather/core/value/static.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:app_weather/presentation/bloc/weather_forecast/forecast_bloc.dart';
import 'package:app_weather/presentation/bloc/weather_today/weather_bloc.dart';
import 'package:app_weather/presentation/page/weather_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'dep_injection.dart' as di;
import 'dep_injection.dart';

void main() async {
  runApp(MyApp());
  di.init();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  print(appDocumentDir.path);
  Hive.registerAdapter(WeatherEntityAdapter());
  Hive.openBox(Static.WEATHER_BOX);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(providers: [
      BlocProvider<WeatherBloc>(
          create: (BuildContext context) => sl<WeatherBloc>()),
      BlocProvider<ForecastBloc>(
          create: (BuildContext context) => sl<ForecastBloc>()),
    ], child: WeatherList()));
  }
}

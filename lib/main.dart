import 'package:app_weather/presentation/page/weather_list_page.dart';
import 'package:flutter/material.dart';

import 'dep_injection.dart' as di;


void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherList()
    );
  }
}

import 'package:app_weather/presentation/widget/input_widget.dart';
import 'package:app_weather/presentation/widget/list_forecast_widget.dart';
import 'package:app_weather/presentation/widget/separator_widget.dart';
import 'package:app_weather/presentation/widget/weather_today.dart';
import 'package:flutter/material.dart';

class WeatherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: InputWidget(),
            ),
            Expanded(child: WeatherToday()),
            SeparatorWidget(),
            ListForecast(),
          ],
        ),
      ),
    );
  }
}

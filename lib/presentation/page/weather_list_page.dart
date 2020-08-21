import 'package:app_weather/presentation/bloc/weather_forecast/forecast_bloc.dart';
import 'package:app_weather/presentation/bloc/weather_today/weather_bloc.dart';
import 'package:app_weather/presentation/widget/input_widget.dart';
import 'package:app_weather/presentation/widget/list_forecast_widget.dart';
import 'package:app_weather/presentation/widget/separator_widget.dart';
import 'package:app_weather/presentation/widget/weather_today.dart';
import 'package:flutter/material.dart';


class WeatherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("WeatherApp"),
        ),
        body:  Container(
              margin: EdgeInsets.symmetric(horizontal: 15), child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: InputWidget(),),
                WeatherToday(),
                SeparatorWidget(),
                ListForecast(),
              ],
            ),
            ),
        );
  }
}

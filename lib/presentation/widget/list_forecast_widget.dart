import 'package:app_weather/core/utils/icon_getter.dart';
import 'package:app_weather/core/value/radii.dart';
import 'package:app_weather/core/value/shadows.dart';
import 'package:app_weather/presentation/bloc/weather_forecast/forecast_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'horizontal_part_tile_widget.dart';

class ListForecast extends StatelessWidget {
  const ListForecast({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (BuildContext context, ForecastState state) {
        if (state is ForecastLoaded) {
          return Container(
            margin: EdgeInsets.only(bottom: 30),
            height: 110,
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.forecastList.length,
                itemBuilder: (BuildContext context, int index) {
                  print(WeatherIcon.getIcon(WeatherIcon.getIcon(state.forecastList[index].icon)));
                  return Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          Shadows.primaryShadow,
                        ],
                        color: Colors.white,
                        borderRadius: Radii.appTileRadius8),
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("${DateFormat('E, ha').format(state.forecastList[index].dt)}"),
                          Container(width: 30, height: 30,child: Image.asset(WeatherIcon.getIcon(state.forecastList[index].icon))),
                          Text(state.forecastList[index].temp.toString())
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        if (state is ForecastLoading) {
          return Text("Loading");
        }
        if (state is ForecastError) {
          return Container();
        }
        if (state is ForecastInitial) {
          return Text("Empty");
        }
        return Text("Empty");
      },
    );
  }

}



import 'package:app_weather/core/utils/icon_getter.dart';
import 'package:app_weather/core/value/colors.dart';
import 'package:app_weather/core/value/style.dart';
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
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  state.weatherEntity.name,
                  style: AppStyle.textBlackBold16,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  state.weatherEntity.description.toUpperCase(),
                  style: AppStyle.textBlackSemiBold22,
                )),
                SizedBox(height: 20,),
                Container(
                    height: 60,
                    width: 60,
                    child: Image.asset(
                        WeatherIcon.getIcon(state.weatherEntity.icon))),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Temp",
                  style: AppStyle.textBlackBold14,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${state.weatherEntity.temp.toString()} °F",
                  style: AppStyle.textBlackSemiBold52,
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("Wind Speed"),
                          Text("${state.weatherEntity.windSpeed.toString()} KM/s"),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Visibility"),
                          Text("${state.weatherEntity.visibility.toString()} M"),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Humidity"),
                          Text("${state.weatherEntity.humidity.toString()} %"),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
        if (state is WeatherLoading) {
          return (Text("loading"));
        }
        if (state is Error) {
          return Text(state.message.toString());
        }
        if (state is WeatherInitial) {
          return Text("Empty");
        }
        return (Text("Empty"));
      },
    );
  }
}

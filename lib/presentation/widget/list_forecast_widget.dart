import 'package:app_weather/presentation/bloc/weather_forecast/forecast_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return Expanded(
            child: GridView.builder(
              itemCount: state.forecastList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: (MediaQuery.of(context).size.width / 1.1) /
                      (MediaQuery.of(context).size.height / 6)),
              itemBuilder: (BuildContext context, int index) {
                return HorizontalTile(
                  weatherEntity: state.forecastList[index],
                );
              },
            ),
          );
        }
        if (state is ForecastLoading) {
          return Text("Loading");
        }
        if(state is ForecastError){
          return Container();
        }
        return Text("Empty");
      },
    );
  }
}

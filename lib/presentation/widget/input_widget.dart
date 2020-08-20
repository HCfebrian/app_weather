import 'package:app_weather/core/value/colors.dart';
import 'package:app_weather/presentation/bloc/weather_forecast/forecast_bloc.dart';
import 'package:app_weather/presentation/bloc/weather_today/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Row(
      children: <Widget>[
        Expanded(
            child: CustomTextField(
          controller: controller,
          hintText: "Masukkan Nama Kota",
        )),
        SizedBox(
          width: 10,
        ),
        CustomButton(
            text: "Cari",
            colorBg: AppColors.secondaryElement,
            onPressed: () {
              print(controller.text);
              BlocProvider.of<WeatherBloc>(context)
                  .add(GetWeather(cityName: controller.text));
              BlocProvider.of<ForecastBloc>(context)
                  .add(GetForecast(cityName: controller.text));
            })
      ],
    );
  }
}

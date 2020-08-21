import 'package:app_weather/core/value/radii.dart';
import 'package:app_weather/core/value/shadows.dart';
import 'package:app_weather/core/value/style.dart';
import 'package:app_weather/domain/weather_entity.dart';
import 'package:flutter/material.dart';

class HorizontalTile extends StatelessWidget {
  final WeatherEntity weatherEntity;

  const HorizontalTile({
    Key key,
    @required this.weatherEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: Radii.appTileRadius8,
          boxShadow: [
            Shadows.primaryShadow,
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: ClipRRect(
                  borderRadius: Radii.appTileRadius8,
                  child: Image.network(
                      "http://openweathermap.org/img/w/${weatherEntity.icon}.png")),
              width: 50,
              decoration: BoxDecoration(
                borderRadius: Radii.appTileRadius8,
                boxShadow: [
                  Shadows.primaryShadow,
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "City",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.textBlackBold11,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          weatherEntity.name.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.textBlackBold11,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Weather",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.textBlackBold11,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          weatherEntity.description.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.textBlackBold11,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Temperature",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.textBlackBold11,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          weatherEntity.temp.toString() + " C",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.textBlackBold11,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Humidity",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.textBlackBold11,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          weatherEntity.humidity.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.textBlackBold11,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Visibility",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.textBlackBold11,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          weatherEntity.visibility.toString() + " M",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.textBlackBold11,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Wind Speed",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.textBlackBold11,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          weatherEntity.windSpeed.toString() + " KM/s",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.textBlackBold11,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "${weatherEntity.dt.day} - " +
                                "${weatherEntity.dt.month} - " +
                                "${weatherEntity.dt.year}  ",
                            style: AppStyle.textBlackBold11,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${weatherEntity.dt.hour} : 00",
                          style: AppStyle.textBlackBold11,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

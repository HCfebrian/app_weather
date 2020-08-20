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
                  child: Icon(Icons.forward)),
              width: 80,
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
                    Text(
                      weatherEntity.name.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.textBlackLight14,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      weatherEntity.description.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.textBlackSemiBold14,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            weatherEntity.dt.toIso8601String(),
                            style: AppStyle.textBlackBold14,
                            overflow: TextOverflow.ellipsis,
                          ),
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

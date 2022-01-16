import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weathernotifier.dart';
import 'package:weather_app/views/components/rainchart.dart';
import 'package:weather_app/views/components/scrollableforecast.dart';
import 'package:weather_app/views/components/weathercard/glasscard.dart';
import 'package:weather_app/views/components/weathercard/weathercard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherNotifier weatherNotifier = WeatherNotifier();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF240046),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: ChangeNotifierProvider<WeatherNotifier>(
            create: (context) {
              weatherNotifier.queryWeatherForecasts();
              return weatherNotifier;
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Consumer<WeatherNotifier>(
                    builder: (context, weather, child) {
                      if (weather.currentWeather == null) {
                        return GlassCard(
                          size: const Size(380, 300),
                        );
                      } else {
                        return WeatherCard(
                          size: weatherCardSize.large,
                          weather: weather.currentWeather,
                        );
                      }
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: ScrollableForecast(),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 20),
                  child: Consumer<WeatherNotifier>(
                    builder: (context, _weather, child) {
                      if (_weather.rainChance == null) {
                        return Container();
                      } else {
                        // I'm entering hardcoded data, since rain probability is a paid feature of the api.
                        return RainChart(
                          rainData: const [
                            FlSpot(0, 30),
                            FlSpot(3, 25),
                            FlSpot(6, 60),
                            FlSpot(9, 50),
                            FlSpot(12, 5),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

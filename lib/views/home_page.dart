import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/repositories/weathernotifier.dart';
import 'package:weather_app/views/components/rainchart.dart';
import 'package:weather_app/views/components/scrollableforecast.dart';
import 'package:weather_app/views/components/weathercard.dart';

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
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: ChangeNotifierProvider<WeatherNotifier>(
          create: (context) {
            weatherNotifier.queryWeatherForecasts();
            return weatherNotifier;
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Consumer<WeatherNotifier>(
                  builder: (context, weather, child) {
                    if (weather.currentWeather == null) {
                      return Container(
                        width: 380,
                        height: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/glass_card.png"),
                          ),
                        ),
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
                margin: EdgeInsets.only(left: 40, right: 20),
                child: RainChart(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

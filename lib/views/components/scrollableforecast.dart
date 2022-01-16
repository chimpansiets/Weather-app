import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/providers/weathernotifier.dart';
import 'package:weather_app/views/components/weathercard/glasscard.dart';
import 'package:weather_app/views/components/weathercard/weathercard.dart';

enum WeatherPeriod {
  today,
  tomorrow,
  fiveDays,
}

class ScrollableForecast extends StatefulWidget {
  const ScrollableForecast({Key? key}) : super(key: key);

  @override
  _ScrollableForecastState createState() => _ScrollableForecastState();
}

class _ScrollableForecastState extends State<ScrollableForecast> {
  Map<WeatherPeriod, int> weatherLengths = {
    WeatherPeriod.today: 8,
    WeatherPeriod.tomorrow: 8,
    WeatherPeriod.fiveDays: 5,
  };

  WeatherPeriod usingWeather = WeatherPeriod.today;
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        buttonTheme: const ButtonThemeData(
          highlightColor: Colors.transparent,
        ),
      ),
      child: SizedBox(
        height: 200,
        width: 392,
        child: Column(
          children: [
            // Buttons of time periods
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ToggleButtons(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        "Today",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: isSelected[0]
                                  ? const Color(0xFFEFCC00)
                                  : Colors.white,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        "Tomorrow",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: isSelected[1]
                                  ? const Color(0xFFEFCC00)
                                  : Colors.white,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        "Five Days",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: isSelected[2]
                                  ? const Color(0xFFEFCC00)
                                  : Colors.white,
                            ),
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      if (index == 0) {
                        usingWeather = WeatherPeriod.today;
                      } else if (index == 1) {
                        usingWeather = WeatherPeriod.tomorrow;
                      } else {
                        usingWeather = WeatherPeriod.fiveDays;
                      }

                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                    });
                  },
                  isSelected: isSelected,
                  renderBorder: false,
                  fillColor: Colors.transparent,
                ),
              ],
            ),
            SizedBox(
              width: 393,
              height: 120,
              child: Consumer<WeatherNotifier>(
                builder: (context, _weather, child) {
                  List<Weather>? _weatherDataToUse;

                  if (usingWeather == WeatherPeriod.today) {
                    _weatherDataToUse = _weather.todayWeather;
                  } else if (usingWeather == WeatherPeriod.tomorrow) {
                    _weatherDataToUse = _weather.tomorrowWeather;
                  } else {
                    _weatherDataToUse = _weather.fiveDayWeather;
                  }

                  if (_weather.currentWeather == null) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weatherLengths[usingWeather],
                      itemBuilder: (context, index) {
                        return GlassCard(
                          size: const Size(140, 100),
                          margin: const EdgeInsets.only(right: 10.0),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weatherLengths[usingWeather],
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: WeatherCard(
                            size: weatherCardSize.small,
                            weather: _weatherDataToUse?[index],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/repositories/weathernotifier.dart';
import 'package:weather_app/views/components/weathercard.dart';

class ScrollableForecast extends StatefulWidget {
  const ScrollableForecast({Key? key}) : super(key: key);

  @override
  _ScrollableForecastState createState() => _ScrollableForecastState();
}

class _ScrollableForecastState extends State<ScrollableForecast> {
  int forecastLength = 8;

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
                TextButton(
                  child: Text(
                    "24 Hours",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onPressed: () {
                    setState(() {
                      forecastLength = 8;
                    });
                  },
                ),
                const SizedBox(width: 40),
                TextButton(
                  child: Text(
                    "Tomorrow",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onPressed: () {
                    setState(() {
                      forecastLength = 8;
                    });
                  },
                ),
                const SizedBox(width: 40),
                TextButton(
                  child: Text(
                    "Next 5 days",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onPressed: () {
                    setState(() {
                      forecastLength = 40;
                    });
                  },
                ),
              ],
            ),
            // Scrollable Weathercards
            SizedBox(
              width: 393,
              height: 120,
              child: Consumer<WeatherNotifier>(
                builder: (context, weather, child) {
                  if (weather.currentWeather == null) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: forecastLength,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 140,
                          height: 100,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/glass_card.png"),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: forecastLength,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: WeatherCard(
                            size: weatherCardSize.small,
                            weather: weather.fiveDayWeather![index],
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

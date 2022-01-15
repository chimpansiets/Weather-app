import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/api/location_service.dart';
import 'package:weather_app/utils/weather_utils.dart';

enum AppState { notDownloaded, downloading, finished }

class WeatherNotifier extends ChangeNotifier {
  final WeatherFactory _wf = WeatherFactory("7fac8e2a17c62d19d24d9f370bcab2b3");
  Weather? currentWeather;
  List<Weather>? todayWeather;
  List<Weather>? tomorrowWeather;
  List<Weather>? fiveDayWeather;

  List<FlSpot>? rainChance;

  AppState state = AppState.notDownloaded;
  Position? lastKnownPosition;

  List<FlSpot> _queryRainChance() {
    print(todayWeather?[0].windSpeed);
    return [];
  }

  void queryWeatherForecasts() async {
    // Removes keyboard overlay
    FocusManager.instance.primaryFocus?.unfocus();

    lastKnownPosition = await determinePosition();

    state = AppState.downloading;

    double lat = lastKnownPosition!.latitude;
    double lon = lastKnownPosition!.longitude;

    currentWeather = await _wf.currentWeatherByLocation(lat, lon);
    fiveDayWeather = await _wf.fiveDayForecastByLocation(lat, lon);
    todayWeather = fiveDayWeather?.sublist(0, 8);
    tomorrowWeather = fiveDayWeather?.sublist(8, 16);

    fiveDayWeather = threeHourToDaily(fiveDayWeather);
    rainChance = _queryRainChance();

    state = AppState.finished;
    notifyListeners();
  }
}

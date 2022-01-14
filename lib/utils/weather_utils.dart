import 'package:weather/weather.dart';

// TODO: Write all-round utility function to convert five day
// weather to specific period and interval.
List<Weather>? threeHourToDaily(List<Weather>? weather) {
  List<Weather>? resultWeather = [];

  for (int i = 0; i < 40; i += 8) {
    resultWeather.add(weather![i]);
  }
  return resultWeather;
}

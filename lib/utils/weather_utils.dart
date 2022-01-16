import 'package:weather/weather.dart';

List<Weather>? threeHourToDaily(List<Weather>? weather) {
  List<Weather>? resultWeather = [];

  for (int i = 0; i < 40; i += 8) {
    resultWeather.add(weather![i]);
  }
  return resultWeather;
}

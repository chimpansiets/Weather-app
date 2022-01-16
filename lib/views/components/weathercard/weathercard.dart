import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/providers/weathernotifier.dart';
import 'package:weather_app/views/components/weathercard/glasscard.dart';

enum weatherCardSize {
  small,
  large,
}

var weatherSizeToSize = {
  weatherCardSize.small: const Size(140, 100),
  weatherCardSize.large: const Size(380, 300),
};

class WeatherCard extends StatefulWidget {
  const WeatherCard({
    Key? key,
    required this.size,
    required this.weather,
  }) : super(key: key);

  final weatherCardSize size;
  final Weather? weather;

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  Size? _size;

  @override
  void initState() {
    _size = weatherSizeToSize[widget.size];
    super.initState();
  }

  String _getCelsiusDigits() {
    String _celsiusDigits =
        widget.weather!.temperature!.celsius!.toStringAsFixed(1);

    if (_celsiusDigits.length > 3) {
      _celsiusDigits = _celsiusDigits.substring(0, 2);
    }

    return _celsiusDigits;
  }

  Widget _getLocationText() {
    return Text(
      "${widget.weather?.areaName}, ${widget.weather?.country}",
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  Widget _createLargeLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: constraints.maxHeight * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: 85.0,
                            ),
                        children: [
                          TextSpan(text: _getCelsiusDigits()),
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(0.0, -60.0),
                              child: Text(
                                "°C",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                      fontSize: 24.0,
                                      color: const Color(0xFFEFCC00),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: constraints.maxWidth * 0.05),
                    Column(
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.29,
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "${widget.weather?.date?.month}-${widget.weather?.date?.day}-${widget.weather?.date?.year}",
                            textAlign: TextAlign.end,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 12.0,
                                    ),
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/images/weather_icons/${widget.weather?.weatherIcon}.svg",
                          height: constraints.maxHeight * 0.35,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: constraints.maxHeight * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/location_icon.svg",
                      color: const Color(0xFFC6A900),
                    ),
                    _getLocationText(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _createSmallLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          alignment: Alignment.center,
          child: Consumer<WeatherNotifier>(
            builder: (context, _weather, _) {
              return Stack(
                children: [
                  Positioned(
                    top: 15.0,
                    right: 15.0,
                    child: SvgPicture.asset(
                      "assets/images/weather_icons/${widget.weather?.weatherIcon}.svg",
                      height: constraints.maxHeight * 0.35,
                    ),
                  ),
                  Positioned(
                    left: 15.0,
                    bottom: 15.0,
                    child: SizedBox(
                      height: constraints.maxHeight * 0.5,
                      width: constraints.maxWidth * 0.4,
                      child: Column(
                        children: [
                          Text(
                            "${widget.weather?.date?.hour}:00",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: const Color(0xFFCCCCCC),
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(
                                    fontSize: 24.0,
                                    color: Colors.white,
                                  ),
                              children: [
                                TextSpan(text: _getCelsiusDigits()),
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(0.0, -14.0),
                                    child: Text(
                                      "°C",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                            fontSize: 14.0,
                                            color: const Color(0xFFEFCC00),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _createChildrenOfSize(weatherCardSize size) {
    if (size == weatherCardSize.large) {
      return _createLargeLayout();
    } else {
      return _createSmallLayout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      size: _size,
      child: _createChildrenOfSize(widget.size),
    );
  }
}

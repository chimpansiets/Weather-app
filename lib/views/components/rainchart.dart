import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RainChart extends StatefulWidget {
  const RainChart({Key? key}) : super(key: key);

  @override
  _RainChartState createState() => _RainChartState();
}

class _RainChartState extends State<RainChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.85,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                // TODO: Get correct chance of rain data
                LineChartData(),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 120,
          height: 34,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Chance of rain",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

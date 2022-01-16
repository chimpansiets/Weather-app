import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/*
** The rainChart currently uses hardcoded data,
** since the probability of rainfall is a paid feature
** of OpenWeatherMap.org.
*/

class RainChart extends StatefulWidget {
  RainChart({Key? key, required this.rainData}) : super(key: key);

  List<FlSpot> rainData;

  @override
  _RainChartState createState() => _RainChartState();
}

class _RainChartState extends State<RainChart> {
  List<Color> gradientColors = [
    const Color(0xFF9C891B),
    const Color(0xFFEFCC00),
  ];

  LineChartBarData _getLineBarsData() {
    return LineChartBarData(
      spots: widget.rainData,
      isCurved: true,
      colors: gradientColors,
      barWidth: 3,
      belowBarData: BarAreaData(
        show: true,
        colors: gradientColors.map((e) => e.withOpacity(0.15)).toList(),
      ),
      dotData: FlDotData(
        show: false,
      ),
    );
  }

  LineChartData _chartData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 3,
          getTextStyles: (context, value) {
            return const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            );
          },
          getTitles: (axisValue) {
            return "${axisValue.toInt()} AM";
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 25,
          getTextStyles: (context, value) {
            return const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            );
          },
          getTitles: (axisValue) {
            if (axisValue == 0 || axisValue == 100) {
              return "";
            }
            return "${axisValue.toInt()}";
          },
        ),
        topTitles: SideTitles(
          showTitles: false,
        ),
        rightTitles: SideTitles(
          showTitles: false,
        ),
      ),
      gridData: FlGridData(
        show: false,
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        _getLineBarsData(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 3.5),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 24, bottom: 12),
              child: LineChart(
                _chartData(),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 240,
          height: 34,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Chance of rain (hardcoded data)",
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

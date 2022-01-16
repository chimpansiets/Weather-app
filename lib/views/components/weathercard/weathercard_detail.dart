import 'package:flutter/material.dart';

/*
** CURRENTLY UNUSED.
** Unfinished plan: the plan was to create an expanded WeatherCard.
** Reason: More information (wind speed, feel temp, etc.)
** Usage: When tapping on a small WeatherCard, start a Hero animation
** to transition from the HomePage to the WeatherCardDetailPage.
*/

class WeatherCardDetailPage extends StatefulWidget {
  const WeatherCardDetailPage({Key? key}) : super(key: key);

  @override
  _WeatherCardDetailPageState createState() => _WeatherCardDetailPageState();
}

class _WeatherCardDetailPageState extends State<WeatherCardDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF240046),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/glass_card_expanded.png",
              ),
            ),
          ),
        ),
      ),
    );
  }
}

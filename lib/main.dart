import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/views/home_page.dart';
import 'package:weather_app/views/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: GoogleFonts.questrial().copyWith(
            color: Colors.white,
            fontSize: 36.0,
          ),
          bodyText1: GoogleFonts.questrial().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
      initialRoute: 'LandingPage',
      routes: {
        'LandingPage': (context) => const LandingPage(),
        'HomePage': (context) => const HomePage(),
      },
    );
  }
}

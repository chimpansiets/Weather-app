import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MobileAndMouseScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MobileAndMouseScrollBehavior(),
      theme: ThemeData(
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
      initialRoute: "HomePage",
      routes: Routes.routes,
    );
  }
}

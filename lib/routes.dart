import 'package:flutter/material.dart';

import 'views/home_page.dart';
import 'views/landing_page.dart';

class Routes {
  Routes._();

  static const String landing = "LandingPage";
  static const String home = "HomePage";

  static final routes = <String, WidgetBuilder>{
    "LandingPage": (context) => const LandingPage(),
    "HomePage": (context) => const HomePage(),
  };
}

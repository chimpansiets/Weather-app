# Sietse's Weather App

A weather application created in flutter using flutter Weather and Provider. Boilerplate supports both web and mobile, although is written with the focus on mobile. clone the appropriate branches mentioned below:

* For Mobile: git@github.com:chimpansiets/Weather-app.git (stable channel)
## Getting Started

This application is made up of a LandingPage and a Homepage. The landing page is meant as a friendly introduction. After this, the Homepage will show you the current weather and weather forecasts. Currently, there is also
an example graph of the predicted rainfall, however the points on the graph
are currently hardcoded because it is a paid feature of the API.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
git@github.com:chimpansiets/Weather-app.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

Connect your smartphone to your computer, execute the following command to ru nthe apllication:

```
flutter run
```

### Libraries & Tools Used

* [Weather](https://pub.dev/packages/weather)
* [Provider](https://pub.dev/packages/provider) (State management)
* [Flutter SVG](https://pub.dev/packages/flutter_svg)
* [Google Fonts](https://pub.dev/packages/google_fonts)
* [Location](https://pub.dev/packages/location)
* [Permission Handler](https://pub.dev/packages/permission_handler)
* [Geolocator](https://pub.dev/packages/geolocator)
* [Fl Chart](https://pub.dev/packages/fl_chart)

### Folder Structure
Here is the core folder structure which flutter provides.

```
Weather-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- api/
|- models/
|- repositories/
|- utils/
|- views/
  - components/
|- main.dart
|- routes.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- api - All calls to external API's are made in this directory.
2- models - Contains the model layer of the project, all custom models
are defined in this directory.
3- providers - Contains store(s) for state-management of the application, to connect the reactive data of the application with the UI. 
4- utils — Contains the utilities/common functions of the application.
5- views — Contains the pages for the application in this folder. All reusable widgets are located in a subdirectory called 'components'.
7- routes.dart — This file contains all the routes for your application.
8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Api

All calls to external API's are made in this directory. For now, the folder
in this project is empty, since I was already using a custom package for retreiving the Weather, and I did not have to make any custom calls to the Api with the http package. If I would have to write custom calls, those files would be placed here.

```
api/
```

### Models

Contains the model layer of the project, all custom models
are defined in this directory.
```
models/
```

### Providers

Contains store(s) for state-management of the application, to connect the reactive data of the application with the UI.

```
providers/
|- weathernotifier.dart
```

### Utils

Contains the common functions and utilities used in a project. The folder structure is as follows: 

```
utils/
|- weather_utils.dart
```

### Views

Contains the pages for the application in this folder. All reusable widgets are located in a subdirectory called 'components'.

```
views/
|- home_page.dart
|- landing_page.dart
|- components/
| - rainchart.dart
| - scrollableforecast.dart
| - weathercard/
|   - glasscard.dart
|   - weathercard.dart
|   - weathercard_detail.dart
```

### Routes

This file contains all the routes for your application.

```dart
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
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```dart
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

```

## Conclusion

This was a fun project to make, although im not totally satisfied with the outcome yet. I am happy with the responsiveness and design of the app. This
project I tried to really maintain a steady flow of operations, make the design first, draw the architecture of the app, and code it after my plan is complete. Although I still feel like some things were not fully thought through with the correct State management architecture in mind. I am happy with the way I wrote the WeatherCard and ScrollableForecast though, since these are fully reusable anywhere in the code and you can easily implement different sizes.

Things I would love feedback on:
- I made some setState() calls in scrollableforecast.dart,
  Is there a better way to do this with a provider? Since I thought myself
  making a completely new provider for the internal state of one widget without needing external data might be a little overkill.[^1]

- My folder structure, and the location of functions.

- Do you think my widget trees in one function are too large?\

- My way of handling the weather data that is not yet retrieved.
  Currently, I return an empy GlassCard widget instead of a WeatherCard in the builder functions of my consumers. Should I have used a FutureBuilder instead of this method? [^2]

Thanks for reading and reviewing!

  [^1]: lib/views/components/scrollableforecast.dart Line 88
  [^2]: lib/views/home_page.dart Line 45, Line 65
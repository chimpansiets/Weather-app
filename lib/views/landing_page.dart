import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF240046),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/landing-background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: constraints.maxHeight * 0.21,
                    bottom: constraints.maxHeight * 0.20),
                child: SvgPicture.asset("assets/images/cloudy_rainy.svg"),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline1,
                  children: const [
                    TextSpan(text: "Weather "),
                    TextSpan(
                      text: "News\n& Feed",
                      style: TextStyle(
                        color: Color(0xFFEFCC00),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFE7C500),
                    fixedSize: Size(constraints.maxWidth * 0.65,
                        constraints.maxHeight * 0.05),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "HomePage");
                  },
                  child: Text(
                    "Get Started",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: 20.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

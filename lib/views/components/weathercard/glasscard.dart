import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  Size? size;
  Widget? child;
  EdgeInsets? margin;
  EdgeInsets? padding;

  GlassCard({
    Key? key,
    required this.size,
    this.margin,
    this.padding,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.width,
      height: size?.height,
      margin: margin,
      padding: padding,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/glass_card.png"),
        ),
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class ThriftyLogo extends StatelessWidget {
  final double size;
  final Color color;

  const ThriftyLogo({
    super.key,
    required this.size,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(this.color, BlendMode.modulate),
        child: Image.asset('assets/logos/logo_white.png'),
      ),
    );
  }
}

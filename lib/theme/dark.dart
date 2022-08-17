import 'package:flutter/material.dart';

class DarkTheme {
  static var primaryGradient = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFF414ed6),
      Color(0xFF5834c7),
    ],
  );

  static var secondaryGradient = const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color(0xFF0d123a),
      Color(0xFF160b2f),
    ],
  );
}

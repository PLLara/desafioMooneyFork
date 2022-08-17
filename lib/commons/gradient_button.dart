import 'package:desafio_mooney/theme/dark.dart';
import 'package:flutter/material.dart';

class MyGradientButton extends StatelessWidget {
  const MyGradientButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.active,
    this.borderRadius,
    this.width,
    this.height = 44.0,
  }) : super(key: key);

  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final Widget child;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return AnimatedOpacity(
      opacity: active ? 1.0 : 0.6,
      duration: const Duration(milliseconds: 200),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: DarkTheme.primaryGradient,
          borderRadius: borderRadius,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}

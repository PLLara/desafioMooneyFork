// ignore_for_file: non_constant_identifier_names

import 'package:desafio_mooney/theme/dark.dart';
import 'package:flutter/material.dart';

double BORDER_SIZE = 4;

class SelectUserCard extends StatelessWidget {
  const SelectUserCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // !

    // *
    return Stack(
      children: [
        SelectUserCardGradientBorder(
          isSelected: isSelected,
        ),
        SelectUserCardAnimatedWrapper(
          isSelected: isSelected,
          onTap: onTap,
          imagePath: imagePath,
          title: title,
          subtitle: subtitle,
        ),
      ],
    );
  }
}

class SelectUserCardAnimatedWrapper extends StatelessWidget {
  const SelectUserCardAnimatedWrapper({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTap;
  final String imagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.all(isSelected ? BORDER_SIZE : 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          color: const Color(0xFF1d1e47),
          child: InkWell(
            splashFactory: InkRipple.splashFactory,
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25 - (isSelected ? BORDER_SIZE : 0)),
              child: SelectUserCardContent(imagePath: imagePath, title: title, subtitle: subtitle),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectUserCardGradientBorder extends StatelessWidget {
  const SelectUserCardGradientBorder({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: DarkTheme.primaryGradient,
        ),
      ),
    );
  }
}

class SelectUserCardContent extends StatelessWidget {
  const SelectUserCardContent({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, width: 65, height: 65, fit: BoxFit.cover),
        const SizedBox(height: 5),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class SelectUserCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final bool isSelected;

  const SelectUserCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isSelected ? const EdgeInsets.all(3) : const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF414ed6),
                Color(0xFF5834c7),
              ])),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF1d1e47),
        ),
        height: MediaQuery.of(context).size.height * 0.28,
        padding: EdgeInsets.symmetric(
            vertical: isSelected ? 20 : 23, horizontal: isSelected ? 15 : 18),
        child: Column(
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
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
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

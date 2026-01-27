import 'package:flutter/material.dart';

enum ProductNutriscore { a, b, c, d, e, unknown }

class NutriScoreWidget extends StatelessWidget {
  final ProductNutriscore nutriscore;

  const NutriScoreWidget({
    super.key,
    required this.nutriscore,
  });

  @override
  Widget build(BuildContext context) {
    // Ici: image statique demandée (SVG trop complexe)
    // Tu peux plus tard choisir l'image selon la lettre.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Nutri-Score",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        Image.asset(
          "assets/images/nutriscore.png",
          height: 44,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}

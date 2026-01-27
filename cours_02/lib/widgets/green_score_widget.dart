import 'package:flutter/material.dart';
import 'package:formation_flutter/res/app_icons.dart';

enum ProductGreenScore { aPlus, a, b, c, d, e, f, unknown }

class GreenScoreWidget extends StatelessWidget {
  final ProductGreenScore greenScore;

  const GreenScoreWidget({
    super.key,
    required this.greenScore,
  });

  String _label(ProductGreenScore s) {
    switch (s) {
      case ProductGreenScore.aPlus:
        return "A+";
      case ProductGreenScore.a:
        return "A";
      case ProductGreenScore.b:
        return "B";
      case ProductGreenScore.c:
        return "C";
      case ProductGreenScore.d:
        return "D";
      case ProductGreenScore.e:
        return "E";
      case ProductGreenScore.f:
        return "F";
      default:
        return "?";
    }
  }

  String _desc(ProductGreenScore s) {
    switch (s) {
      case ProductGreenScore.aPlus:
      case ProductGreenScore.a:
        return "Très faible impact environnemental";
      case ProductGreenScore.b:
        return "Faible impact environnemental";
      case ProductGreenScore.c:
        return "Impact modéré sur l'environnement";
      case ProductGreenScore.d:
        return "Impact environnemental élevé";
      case ProductGreenScore.e:
      case ProductGreenScore.f:
        return "Impact environnemental très élevé";
      default:
        return "Non renseigné";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icône GreenScore (dans ta police d’icônes)
        const Icon(AppIcons.ecoscore, size: 28),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "EcoScore",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(
                "${_label(greenScore)} · ${_desc(greenScore)}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

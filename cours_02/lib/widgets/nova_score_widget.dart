import 'package:flutter/material.dart';

class NovaScoreWidget extends StatelessWidget {
  final int? group; // 1..4

  const NovaScoreWidget({
    super.key,
    required this.group,
  });

  String _novaText(int? g) {
    switch (g) {
      case 1:
        return "Aliments non transformés ou transformés minimalement";
      case 2:
        return "Ingrédients culinaires transformés";
      case 3:
        return "Aliments transformés";
      case 4:
        return "Produits alimentaires et boissons ultra-transformés";
      default:
        return "Non renseigné";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Groupe NOVA",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        Text(
          _novaText(group),
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

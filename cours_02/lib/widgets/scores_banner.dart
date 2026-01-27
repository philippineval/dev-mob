import 'package:flutter/material.dart';
import 'axis_divider.dart';
import 'nutriscore_widget.dart';
import 'nova_score_widget.dart';
import 'green_score_widget.dart';

class ScoresBanner extends StatelessWidget {
  final ProductNutriscore nutriscore;
  final int? novaGroup; // 1..4
  final ProductGreenScore greenScore;

  const ScoresBanner({
    super.key,
    required this.nutriscore,
    required this.novaGroup,
    required this.greenScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Ligne 1 : NutriScore | separator | Nova
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 44, // 44%
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: NutriScoreWidget(nutriscore: nutriscore),
                  ),
                ),
                const AxisDivider(axis: Axis.vertical, thickness: 1),
                Expanded(
                  flex: 56, // le reste
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: NovaScoreWidget(group: novaGroup),
                  ),
                ),
              ],
            ),
          ),

          const AxisDivider(axis: Axis.horizontal, thickness: 1),

          // Ligne 2 : EcoScore / GreenScore
          Padding(
            padding: const EdgeInsets.all(16),
            child: GreenScoreWidget(greenScore: greenScore),
          ),
        ],
      ),
    );
  }
}

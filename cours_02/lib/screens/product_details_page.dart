import 'package:flutter/material.dart';
import '../widgets/product_header.dart';
import '../widgets/scores_banner.dart';
import '../widgets/nutriscore_widget.dart';
import '../widgets/green_score_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductHeader(
              imageUrl: "assets/images/product_header.jpg",
              productName: "Petits pois et carottes",
              brand: "Cassegrain",
              onBack: () => Navigator.pop(context),
              onShare: () {},
            ),

            const SizedBox(height: 16),

            ScoresBanner(
              nutriscore: ProductNutriscore.a,
              novaGroup: 4,
              greenScore: ProductGreenScore.d,
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.all(20),
              child: Text("Contenu de la fiche produit (à compléter ensuite)"),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

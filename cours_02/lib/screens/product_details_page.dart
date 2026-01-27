import 'package:flutter/material.dart';
import '../widgets/product_header.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductHeader(
              imageUrl:
                  "https://images.unsplash.com/photo-1499636136210-6f4ee915583e",
              productName: "Petits pois et carottes",
              brand: "Cassegrain",
              onBack: () => Navigator.pop(context),
              onShare: () {},
            ),

            // Le reste des infos viendra dans les prochaines étapes du TP
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

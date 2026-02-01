import 'package:flutter/foundation.dart';
import 'product.dart';

class ProductNotifier extends ChangeNotifier {
  Product? _product;

  ProductNotifier() {
    loadProduct();
  }

  Product? get product => _product;

  void loadProduct() {
    _product = Product(
  barcode: '123456789',
  name: 'Produit test',
  brands: ['Marque test'],
  nutriScore: ProductNutriScore.A,
  novaScore: ProductNovaScore.group1,
  greenScore: ProductGreenScore.A,
);

    notifyListeners();
  }
}

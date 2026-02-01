import 'package:flutter/foundation.dart';
import 'product.dart';

class ProductNotifier extends ChangeNotifier {
  Product? _product;

  Product? get product => _product;

  void loadProduct() {
    _product = generateProduct();
    notifyListeners();
  }
}

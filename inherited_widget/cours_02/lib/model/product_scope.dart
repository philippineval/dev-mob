import 'package:flutter/widgets.dart';
import 'package:formation_flutter/model/product.dart';

class ProductScope extends InheritedWidget {
  const ProductScope({super.key, required this.product, required super.child});

  final Product product;

  static Product of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ProductScope>();
    assert(scope != null);
    return scope!.product;
  }

  @override
  bool updateShouldNotify(ProductScope oldWidget) => product != oldWidget.product;
}

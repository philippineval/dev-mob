import 'package:flutter/material.dart';

class ProductHeader extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String brand;
  final VoidCallback? onBack;
  final VoidCallback? onShare;

  const ProductHeader({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.brand,
    this.onBack,
    this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imageUrl,
          width: double.infinity,
          height: 320,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 40,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: onBack,
          ),
        ),
        Positioned(
          top: 40,
          right: 16,
          child: IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: onShare,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  brand,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

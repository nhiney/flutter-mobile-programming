import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  product.image,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            _info('Mã sản phẩm', product.code),
            _info('Tên sản phẩm', product.name),
            _info('Nhà sản xuất', product.brand),
            _info('Giá bán', product.price, highlight: true),

            const SizedBox(height: 16),

            const Text(
              'Mô tả sản phẩm',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(product.description),
          ],
        ),
      ),
    );
  }

  Widget _info(String label, String value, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
                color: highlight ? Colors.blue : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

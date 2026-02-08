import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<Product> products = [
    Product(
      code: 'SP001',
      name: 'Tai nghe Bluetooth',
      brand: 'Sony',
      price: '1.200.000 VNĐ',
      description: 'Âm thanh chất lượng cao, pin bền.',
      image: 'assets/product1_1.png',
    ),
    Product(
      code: 'SP002',
      name: 'Chuột không dây',
      brand: 'Logitech',
      price: '650.000 VNĐ',
      description: 'Chuột nhẹ, pin lâu.',
      image: 'assets/product1_2.png',
    ),
    Product(
      code: 'SP003',
      name: 'Bàn phím cơ',
      brand: 'Keychron',
      price: '1.800.000 VNĐ',
      description: 'Thiết kế hiện đại, gõ êm.',
      image: 'assets/product1_3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sản phẩm'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      p.image,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(p.price,
                            style: const TextStyle(color: Colors.blue)),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      ProductDetailScreen(product: p),
                                ),
                              );
                            },
                            child: const Text('Xem chi tiết'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

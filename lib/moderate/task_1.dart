import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String image;
  Product(this.name, this.price, this.image);
}

class ModerateTask1 extends StatelessWidget {
  const ModerateTask1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = List.generate(
      12,
      (index) => Product('Product ${index + 1}', (index + 1) * 10.0, 'https://via.placeholder.com/150'),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 1: Product Catalog')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Column(
              children: [
                Expanded(child: Image.network(product.image, fit: BoxFit.cover)),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text('\$${product.price.toStringAsFixed(2)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

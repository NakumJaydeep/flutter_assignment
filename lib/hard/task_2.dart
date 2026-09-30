import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product {
  final String id;
  final String title;
  final double price;
  Product({required this.id, required this.title, required this.price});
}

class ShopProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(id: '1', title: 'Laptop', price: 999.99),
    Product(id: '2', title: 'Phone', price: 499.99),
    Product(id: '3', title: 'Tablet', price: 299.99),
  ];

  final List<Product> _cart = [];

  List<Product> get products => _products;
  List<Product> get cart => _cart;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  double get total => _cart.fold(0, (sum, item) => sum + item.price);
}

class HardTask2 extends StatelessWidget {
  const HardTask2({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hard 2: E-commerce Shop'),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                ),
              ),
            )
          ],
        ),
        body: Consumer<ShopProvider>(
          builder: (context, shop, child) {
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: shop.products.length,
              itemBuilder: (context, i) => Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(shop.products[i].title, style: const TextStyle(fontSize: 18)),
                    Text('\$${shop.products[i].price}'),
                    ElevatedButton(
                      onPressed: () => shop.addToCart(shop.products[i]),
                      child: const Text('Add to Cart'),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<ShopProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: shop.cart.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(shop.cart[i].title),
                trailing: Text('\$${shop.cart[i].price}'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutSummary()),
              ),
              child: const Text('Checkout'),
            ),
          )
        ],
      ),
    );
  }
}

class CheckoutSummary extends StatelessWidget {
  const CheckoutSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<ShopProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Order Summary')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Total items:', style: TextStyle(fontSize: 20)),
            Text('${shop.cart.length}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Total Amount:', style: TextStyle(fontSize: 20)),
            Text('\$${shop.total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}

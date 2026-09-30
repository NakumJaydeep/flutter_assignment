import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem {
  final String id;
  final String title;
  final double price;

  CartItem({required this.id, required this.title, required this.price});
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price;
    });
    return total;
  }

  void addItem(String productId, String title, double price) {
    _items.putIfAbsent(
      productId,
      () => CartItem(id: DateTime.now().toString(), title: title, price: price),
    );
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}

class ModerateTask8 extends StatelessWidget {
  const ModerateTask8({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Moderate 8: Shopping Cart'),
          actions: [
            Consumer<CartProvider>(
              builder: (context, cart, child) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Total: \$${cart.totalAmount.toStringAsFixed(2)}'),
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ProductTile(id: 'p1', title: 'Product 1', price: 29.99),
                  ProductTile(id: 'p2', title: 'Product 2', price: 59.99),
                  ProductTile(id: 'p3', title: 'Product 3', price: 19.99),
                ],
              ),
            ),
            const Divider(),
            const Expanded(child: CartList()),
          ],
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final String id;
  final String title;
  final double price;

  const ProductTile({super.key, required this.id, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('\$$price'),
      trailing: IconButton(
        icon: const Icon(Icons.add_shopping_cart),
        onPressed: () {
          Provider.of<CartProvider>(context, listen: false).addItem(id, title, price);
        },
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.items.values.toList();
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (ctx, i) => ListTile(
        title: Text(cartItems[i].title),
        subtitle: Text('\$${cartItems[i].price}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            cart.removeItem(cart.items.keys.toList()[i]);
          },
        ),
      ),
    );
  }
}

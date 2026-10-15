import 'package:flutter/material.dart';
import 'db_helper.dart';

class Task3SqliteProducts extends StatefulWidget {
  const Task3SqliteProducts({super.key});

  @override
  State<Task3SqliteProducts> createState() => _Task3SqliteProductsState();
}

class _Task3SqliteProductsState extends State<Task3SqliteProducts> {
  final DBHelper _dbHelper = DBHelper();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  List<Map<String, dynamic>> _products = [];

  @override
  void initState() {
    super.initState();
    _refreshProducts();
  }

  void _refreshProducts() async {
    final db = await _dbHelper.db;
    final data = await db.query('products');
    setState(() {
      _products = data;
    });
  }

  Future<void> _addProduct() async {
    final db = await _dbHelper.db;
    await db.insert('products', {
      'name': _nameController.text,
      'price': double.parse(_priceController.text),
    });
    _nameController.clear();
    _priceController.clear();
    _refreshProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 3: SQLite Products")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Product Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Product Price"),
            ),
          ),
          ElevatedButton(onPressed: _addProduct, child: const Text("Add Product")),
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_products[index]['name']),
                subtitle: Text("Price: \$${_products[index]['price']}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

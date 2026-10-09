import 'package:flutter/material.dart';

// Generic Model
abstract class Entity {
  Map<String, dynamic> toJson();
}

class Product extends Entity {
  final String id;
  final String name;
  Product({required this.id, required this.name});
  
  @override
  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

// Generic Repository Interface
abstract class Repository<T extends Entity> {
  Future<List<T>> getAll();
  Future<void> save(T item);
}

// Implementation of Local Data Source (Mocking Hive/SP)
class LocalDataSource<T extends Entity> {
  final List<T> _storage = [];
  Future<List<T>> fetch() async => _storage;
  Future<void> persist(T item) async => _storage.add(item);
}

// Implementation of Remote Data Source (Mocking API)
class RemoteDataSource<T extends Entity> {
  Future<List<T>> fetch() async => []; // Mocking API call
  Future<void> send(T item) async {} // Mocking POST call
}

// Concrete Repository Implementation
class ProductRepository implements Repository<Product> {
  final LocalDataSource<Product> local;
  final RemoteDataSource<Product> remote;

  ProductRepository({required this.local, required this.remote});

  @override
  Future<List<Product>> getAll() async {
    // Logic: Try local first, or try remote and cache locally
    var items = await local.fetch();
    if (items.isEmpty) {
      items = await remote.fetch();
      // Cache logic here
    }
    return items;
  }

  @override
  Future<void> save(Product item) async {
    await local.persist(item);
    await remote.send(item);
  }
}

void main() => runApp(const MaterialApp(home: Q4Page()));

class Q4Page extends StatelessWidget {
  const Q4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 3 - Q4: Generic Repo")),
      body: const Center(
        child: Text("Repository Pattern Implemented in Code.\nCheck lib/solutions/level3/q4.dart", textAlign: TextAlign.center),
      ),
    );
  }
}

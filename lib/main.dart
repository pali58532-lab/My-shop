// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(SidraShopApp());
}

class SidraShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidra Shop',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        brightness: Brightness.light,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {"name": "T-shirt", "price": "₹499"},
    {"name": "Jeans", "price": "₹999"},
    {"name": "Shoes", "price": "₹1499"},
    {"name": "Bag", "price": "₹799"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sidra Shop'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(products[index]["name"]!),
              subtitle: Text(products[index]["price"]!),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${products[index]["name"]} added to cart')),
                  );
                },
                child: Text('Add to Cart'),
              ),
            ),
          );
        },
      ),
    );
  }
}

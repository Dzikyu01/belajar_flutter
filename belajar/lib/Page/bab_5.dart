import 'package:flutter/material.dart';

class Bab5 extends StatelessWidget {
  const Bab5({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductListScreen();
  }
}

class Product {
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  const Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

// Data produk hardcode
const List<Product> products = [
  Product(
    name: 'Laptop Gaming',
    price: 15000000,
    description:
        'Laptop gaming dengan spesifikasi tinggi untuk pengalaman gaming maksimal.',
    imageUrl: 'https://via.placeholder.com/200x150.png?text=Laptop+Gaming',
  ),
  Product(
    name: 'Smartphone',
    price: 5000000,
    description:
        'Smartphone dengan kamera berkualitas dan baterai tahan lama.',
    imageUrl: 'https://via.placeholder.com/200x150.png?text=Smartphone',
  ),
  Product(
    name: 'Headphone',
    price: 750000,
    description:
        'Headphone dengan kualitas suara premium dan noise cancelling.',
    imageUrl: 'https://via.placeholder.com/200x150.png?text=Headphone',
  ),
];

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product.imageUrl, width: 50, height: 50),
            title: Text(product.name),
            subtitle: Text('Rp ${product.price.toStringAsFixed(0)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(product.imageUrl, height: 200),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rp ${product.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali ke Daftar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

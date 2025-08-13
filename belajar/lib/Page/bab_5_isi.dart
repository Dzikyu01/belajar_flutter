import 'package:flutter/material.dart';

// --- Model Data Produk ---
class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}

// --- Data Dummy Produk ---
final List<Product> products = [
  Product(
    name: 'Laptop Gaming',
    price: 1500.00,
    imageUrl: 'https://images.tokopedia.net/img/JFrBQq/2024/2/23/18dba883-ff38-491c-a10e-ce2ee6ed95f3.jpg',
    description:
        'Laptop berperforma tinggi yang dirancang khusus untuk gaming dengan grafis dan kecepatan luar biasa.',
  ),
  Product(
    name: 'Keyboard Mekanik',
    price: 120.00,
    imageUrl:
        'https://alhasanah.or.id/wp-content/uploads/2022/09/Al-Hasanah-Keyboard-Mechanical-1.png',
    description:
        'Keyboard dengan switch mekanik yang memberikan umpan balik taktil dan suara klik yang memuaskan.',
  ),
  Product(
    name: 'Mouse Wireless',
    price: 45.00,
    imageUrl: 'https://jete.id/wp-content/uploads/2024/09/Mouse-JETE-MS201-1-768x768.jpg',
    description:
        'Mouse nirkabel yang nyaman dan responsif, ideal untuk penggunaan sehari-hari maupun gaming.',
  ),
  Product(
    name: 'Monitor UltraWide',
    price: 350.00,
    imageUrl: 'https://upload.jaknot.com/2020/08/images/products/efa74f/original/xiaomi-ultra-wide-curved-gaming-monitor-1440p-144hz-free-sync-34-inch.jpg',
    description:
        'Monitor dengan rasio aspek ultrawide untuk pengalaman visual yang lebih imersif dan produktivitas.',
  ),
  Product(
    name: 'Headset Gaming',
    price: 80.00,
    imageUrl: 'https://jete.id/wp-content/uploads/2023/05/mock-up-ga5-1-1.jpg',
    description:
        'Headset dengan kualitas suara jernih dan mikrofon yang sensitif untuk komunikasi tim yang efektif.',
  ),
  Product(
    name: 'Webcam HD',
    price: 60.00,
    imageUrl: 'https://play-lh.googleusercontent.com/QxpQbQUOn2XuaGDhwqyPP7XLWDxAWlNBX5uYZkRPTX6HC-oUR2jpkJ57Ia4lZzy_TUu2=w480-h960',
    description:
        'Webcam resolusi tinggi untuk video call dan streaming yang jelas dan tajam.',
  ),
  Product(
    name: 'SSD 1TB',
    price: 100.00,
    imageUrl: 'https://els.id/wp-content/uploads/2024/12/SSD-m.2-NVMe-1TB-Samsung-EVO-970-Plus.png',
    description:
        'Solid State Drive (SSD) berkapasitas 1TB yang menawarkan kecepatan baca dan tulis yang super cepat.',
  ),
];

// --- Halaman Daftar Produk (Bab5) ---
// Nama kelas diubah dari ProductListScreen menjadi Bab5.
class Bab5 extends StatelessWidget {
  const Bab5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                leading: Image.network(
                  product.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(product.name),
                subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(product: product),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// --- Halaman Detail Produk (ProductDetailScreen) ---
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              product.imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

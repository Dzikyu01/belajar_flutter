// bab_1.dart
import 'package:flutter/material.dart';

class Bab1 extends StatelessWidget {
  const Bab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bab 1: Jawaban Soal Flutter'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Column(
        children: [
          Text(
            '1. Apa itu Flutter?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Flutter adalah UI toolkit dari Google untuk membuat aplikasi native di berbagai platform dari satu kode sumber tunggal. Tujuannya adalah untuk efisiensi dan performa tinggi.',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '2. Keuntungan Flutter',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '  - Satu kode untuk multi-platform\n  - Fitur "Hot Reload" yang cepat\n  - Performa yang mirip native',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '3. Konsep "Everything is a Widget"',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Setiap elemen UI di Flutter, dari tombol hingga tata letak, adalah widget. Kita menyusunnya seperti balok LEGO untuk membangun antarmuka.',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '4. Perbedaan dengan Native',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Native development butuh kode berbeda untuk setiap platform (misalnya Kotlin untuk Android, Swift untuk iOS), sedangkan Flutter hanya butuh satu kode dalam bahasa Dart untuk semua platform.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

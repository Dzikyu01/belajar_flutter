import 'package:flutter/material.dart';

class Bab3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gabungan Widget'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Konten dari StatelessWidget
              const Text(
                'Saya adalah Stateless Widget, gak bisa berubah',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 50), // Memberi sedikit jarak agar tidak menempel

              // Konten dari StatefulWidget
              const Text(
                'Saya stateful, jadi bisa berubah. Anda telah menekan tombol sebanyak:',
                style: TextStyle(fontSize: 18),
              ),
              StatefulWidgetExample(),
            ],
          ),
        ),
    );
  }
}

class StatefulWidgetExample extends StatefulWidget {
  const StatefulWidgetExample({super.key});

  @override
  State<StatefulWidgetExample> createState() => _StatefulWidgetExampleState();
}

class _StatefulWidgetExampleState extends State<StatefulWidgetExample> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$_counter',
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Text('Tambah'),
        ),
      ],
    );
  }
}

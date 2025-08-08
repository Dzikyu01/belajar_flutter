import 'package:flutter/material.dart';
import 'page/bab_1.dart' as bab1;
import 'page/bab_2.dart' as bab2;
import 'page/bab_3.dart' as bab3;
import 'page/bab_4.dart' as bab4;
import 'page/bab_5.dart' as bab5;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BabSelector(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}

class BabSelector extends StatelessWidget {
  const BabSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Bab'),
        elevation: 4,
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBabButton(context, 'Bab 1', () => bab1.Bab1()),
                const SizedBox(height: 12),
                _buildBabButton(context, 'Bab 2', () => bab2.Bab2()),
                const SizedBox(height: 12),
                _buildBabButton(context, 'Bab 3', () => bab3.Bab3()),
                const SizedBox(height: 12),
                _buildBabButton(context, 'Bab 4', () => bab4.Bab4()),
                const SizedBox(height: 12),
                _buildBabButton(context, 'Bab 5', () => bab5.Bab5()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBabButton(BuildContext context, String title, Widget Function() page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 3,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
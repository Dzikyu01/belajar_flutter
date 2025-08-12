import 'package:flutter/material.dart';

class Bab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About Me!"),
          backgroundColor: Colors.grey[400],
        ),
        body: const Center(
          child: Text(
            'Arkandi & Dzikral, XII RPL',
            style: TextStyle(fontSize: 35),
            ),
        ),
    );
  }
}

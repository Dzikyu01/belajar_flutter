import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelloStateful(),
    );
  }
}

class HelloStateful extends StatefulWidget {
  @override
  _HelloStatefulState createState() => _HelloStatefulState();
}

class _HelloStatefulState extends State<HelloStateful> {
  int counter = 0;

  void tambahAngka() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tombol ditekan sebanyak:'),
            Text(
              '$counter kali',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: tambahAngka,
              child: Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelloStateless(),
    );
  }
}

class HelloStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateless Widget')),
      body: Center(
        child: Text('Halo, saya Stateless!'),
      ),
    );
  }
}

*/

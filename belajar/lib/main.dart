import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page/bab_1.dart' as bab1;
import 'page/bab_2.dart' as bab2;
import 'page/bab_3.dart' as bab3;
import 'page/bab_4.dart' as bab4;
import 'page/bab_5.dart' as bab5;
import 'Page/bab_6.dart' as bab6;
import 'page/bab_7.dart' as bab7;
import 'page/bab_8.dart' as bab8;
import 'page/bab_9.dart' as bab9;
import 'page/bab_10.dart' as bab10;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BabSelector(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}

class BabSelector extends StatefulWidget {
  const BabSelector({Key? key}) : super(key: key);

  @override
  State<BabSelector> createState() => _BabSelectorState();
}

class _BabSelectorState extends State<BabSelector> {
  // Menggunakan objek LogicalKeyboardKey yang lebih andal
  final List<LogicalKeyboardKey> _sequence = const [
    LogicalKeyboardKey.arrowUp,
    LogicalKeyboardKey.arrowUp,
    LogicalKeyboardKey.arrowDown,
    LogicalKeyboardKey.arrowDown,
    LogicalKeyboardKey.arrowLeft,
    LogicalKeyboardKey.arrowRight,
    LogicalKeyboardKey.arrowLeft,
    LogicalKeyboardKey.arrowRight,
    LogicalKeyboardKey.keyB,
    LogicalKeyboardKey.keyA,
  ];

  final List<LogicalKeyboardKey> _inputs = [];
  bool _konamiTriggered = false;
  final FocusNode _focusNode = FocusNode();
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _processInput(RawKeyEvent event) {
    if (_konamiTriggered) {
      return;
    }

    if (event is RawKeyDownEvent) {
      _inputs.add(event.logicalKey);

      if (_inputs.length > _sequence.length) {
        _inputs.removeAt(0);
      }

      if (_inputs.length == _sequence.length) {
        bool match = true;
        for (int i = 0; i < _sequence.length; i++) {
          if (_inputs[i] != _sequence[i]) {
            match = false;
            break;
          }
        }
        if (match) {
          _triggerSecretFeature();
          _inputs.clear();
          _konamiTriggered = true;
        }
      }
    }
  }

  void _triggerSecretFeature() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Selamat, kamu menemukan kode rahasia! 🎉',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[600],
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _processInput,
      autofocus: true,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(_focusNode);
        },
        child: Scaffold(
          key: _scaffoldKey,
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
                    const SizedBox(height: 12),
                    _buildBabButton(context, 'Bab 6', () => bab6.Bab6()),
                    const SizedBox(height: 12),
                    _buildBabButton(context, 'Bab 7', () => bab7.Bab7()),
                    const SizedBox(height: 12),
                    _buildBabButton(context, 'Bab 8', () => bab8.Bab8()),
                    const SizedBox(height: 12),
                    _buildBabButton(context, 'Bab 9', () => bab9.Bab9()),
                    const SizedBox(height: 12),
                    _buildBabButton(context, 'Bab 10', () => bab10.Bab10()),
                  ],
                ),
              ),
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

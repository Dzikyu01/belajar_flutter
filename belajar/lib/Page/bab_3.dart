import 'package:flutter/material.dart';

class Bab3 extends StatelessWidget {
  const Bab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bab 3: Popular Widget'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Foto profil dengan gambar kucing acak dari internet
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://image.idntimes.com/post/20250320/pexels-psad-17393531-f94cc3a9ebb118a5253615831e4b5094-d10e5026bc039cb04ceec167237e038d.jpg?tr=w-1200,f-webp,q-75&width=1200&format=webp&quality=75'),
              ),
              SizedBox(height: 20),

              // Nama lengkap
              Text(
                'Niki Si Kucing',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 5),

              // Profesi/Pekerjaan
              Text(
                'CEO (Chief Eating Officer)',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),

              // Ikon media sosial
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook, size: 30, color: Colors.blue),
                  SizedBox(width: 15),
                  Icon(Icons.camera_alt, size: 30, color: Colors.pink),
                  SizedBox(width: 15),
                  Icon(Icons.email, size: 30, color: Colors.orange),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

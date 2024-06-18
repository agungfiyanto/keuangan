import 'package:flutter/material.dart';
import 'package:keuangan/page/halaman_awal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(child: HalamanAwal()),
    );
  }
}

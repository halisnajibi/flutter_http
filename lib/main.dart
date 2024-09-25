import 'package:flutter/material.dart';
import 'package:flutter_http/dasar/latihan4.dart';
import 'dasar/latihan_3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Latihan4(),
    );
  }
}

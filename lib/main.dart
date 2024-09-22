import 'package:flutter/material.dart';
import 'package:flutter_http/http/latihan2.dart';
import 'package:flutter_http/http/latihan3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Latihan3(),
    );
  }
}

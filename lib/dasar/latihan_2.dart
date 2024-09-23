import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_http/dasar/model/sample2.dart';

class Latihan2 extends StatelessWidget {
  const Latihan2({super.key});

  Future<Sample2> _getData() async {
    final response = await rootBundle.loadString("assets/data/sample2.json");
    final jsonData = jsonDecode(response);
    return Sample2.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder<Sample2>(
          future: _getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Text('eroor');
            }
            if (snapshot.hasData) {
              final data = snapshot.data!;
            }
            return Container();
          },
        ));
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/sample3.dart';

class Latihan3 extends StatelessWidget {
  const Latihan3({super.key});
  Future<Sample3> _getData() async {
    final response = await rootBundle.loadString("assets/data/sample3.json");
    final jsonData = jsonDecode(response);
    return Sample3.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            final result = snapshot.data!;
            final ayat = result.data.ayat;
            return ListView.builder(
              itemCount: ayat.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(ayat[index].teksLatin),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

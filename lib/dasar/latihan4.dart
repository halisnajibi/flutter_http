import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/sample4.dart';

class Latihan4 extends StatelessWidget {
  const Latihan4({super.key});
  Future<Sample4> _getData() async {
    final response = await rootBundle.loadString("assets/data/sample4.json");
    final jsonData = jsonDecode(response);
    return Sample4.fromJson(jsonData);
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
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            final result = snapshot.data!;
            final data = result.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(data[index].type),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data[index].attributes.title),
                        Text(data[index].attributes.body),
                      ],
                    ));
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

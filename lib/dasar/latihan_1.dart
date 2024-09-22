import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_http/dasar/model/sample.dart';

import 'widgets/listdynamic.dart';
import 'widgets/listring.dart';

class Latihan1 extends StatefulWidget {
  const Latihan1({super.key});

  @override
  State<Latihan1> createState() => _Latihan1State();
}

class _Latihan1State extends State<Latihan1> {
  Sample? result;
  Future _getData() async {
    String jsonString = await rootBundle.loadString("assets/data/sample.json");
    final jsonData = jsonDecode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
      result = sample;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(result?.articles);
    List<String>? hoby = result?.hoby;
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter pasring data"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _getData();
              },
              child: const Text("get json")),
          // string(result: result)
          // listString(hoby: hoby)
          // listOfDynamic(result: result)
          Container(
            height: 500,
            child: ListView.builder(
              itemCount: result?.articles?.length ?? 1,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(result?.articles?[index]?.title ?? 'No Title'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

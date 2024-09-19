import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPage extends StatefulWidget {
  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  late String nama;
  late String email;
  @override
  void initState() {
    // TODO: implement initState
    nama = "kosong";
    email = "kosong";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP GET"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("email : $email"),
          Text("nama depan : $nama"),
          ElevatedButton(
            onPressed: () async {
              var request =
                  await http.get(Uri.parse("https://reqres.in/api/users/2"));
              if (request.statusCode == 200) {
                var response = request.body;
                var data = json.decode(response) as Map<String, dynamic>;

                setState(() {
                  email = data["data"]["email"].toString();
                  nama = data["data"]["first_name"].toString();
                });
              } else {
                print("error");
              }
            },
            child: Text("get"),
          ),
          // ListView.builder(
          //   itemCount: array.length,
          //   itemBuilder: (context, index) {
          //     return Text("index.email");
          //   },
          // )
        ],
      ),
    );
  }
}

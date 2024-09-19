import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  String hasilResponse = "belum ada";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP UPDATE"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("nama"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("job"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              var response = await http
                  .post(Uri.parse("https://reqres.in/api/users/2"), body: {
                "name": nameC.text,
                "job": jobC.text,
                "id": "202",
                "createdAt": "2024-09-19T08:31:18.205Z"
              });
              var data = json.decode(response.body) as Map<String, dynamic>;
              setState(() {
                hasilResponse = "${data['name']} - ${data['job']}";
              });
            },
            child: Text("submit"),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(),
          const SizedBox(
            height: 15,
          ),
          Text(hasilResponse),
        ],
      ),
    );
  }
}

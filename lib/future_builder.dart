import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http/models/user.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class FutureBuilderPage extends StatelessWidget {
  List<User> userModel = [];
  Future getData() async {
    var request = await http.get(Uri.parse("https://reqres.in/api/users"));
    List response = (json.decode(request.body) as Map<String, dynamic>)["data"];
    response.forEach((r) {
      userModel.add(User.fromJson(r));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP FLUTTER FUTURE BUILDER"),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapsot) {
            if (snapsot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("loading....."),
              );
            } else {
              return ListView.builder(
                itemCount: userModel.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(userModel[index].firstName),
                  subtitle: Text(userModel[index].email),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(userModel[index].avatar),
                  ),
                ),
              );
            }
          }),
    );
  }
}

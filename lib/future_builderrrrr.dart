import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http/models/userr.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class FutureBuilderPageeee extends StatelessWidget {
  List<UserModel> allUser = [];
  Future getAllUser() async {
    try {
      var request =
          await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
      List response =
          (json.decode(request.body) as Map<String, dynamic>)["data"];
      response.forEach((r) {
        allUser.add(UserModel.fromJson(r));
      });
    } catch (e) {
      print("error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Future Builder"),
          backgroundColor: Colors.green,
        ),
        body: FutureBuilder(
            future: getAllUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("loading..."),
                );
              } else {
                return ListView.builder(
                  itemCount: allUser.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(allUser[index].avatar),
                    ),
                    title: Text("${allUser[index].firstName}"),
                    subtitle: Text("${allUser[index].email}"),
                  ),
                );
              }
            }));
  }
}

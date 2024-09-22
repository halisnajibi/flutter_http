import 'package:flutter/material.dart';
import 'package:flutter_http/http/service/user_service.dart';

import 'model/user.dart';

class Latihan2 extends StatefulWidget {
  const Latihan2({super.key});

  @override
  State<Latihan2> createState() => _Latihan2State();
}

class _Latihan2State extends State<Latihan2> {
  List<User> users = [];
  bool isLpoading = true;
  void fetchUser() async {
    isLpoading = true;
    final result = await UserService.fetchUser();
    setState(() {
      users = result;
      isLpoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("http"),
        backgroundColor: Colors.blue,
      ),
      body: isLpoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  child: ListTile(
                    title: Text(user.firstName + ' ' + user.lastName),
                    subtitle: Text(user.email),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

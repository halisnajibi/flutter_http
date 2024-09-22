import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_http/http/model/user.dart';
import 'package:flutter_http/http/service/user_service.dart';

class Latihan3 extends StatelessWidget {
  const Latihan3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("http"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<User>>(
        future: UserService.fetchUser(),
        builder: (context, snapshot) {
          final users = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: users!.length,
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
            );
          }
          return const Text("error");
        },
      ),
    );
  }
}

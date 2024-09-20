import 'package:flutter/material.dart';
import 'package:flutter_http/v2/apiservice.dart';
import 'model/person.dart';

class PersonPage extends StatefulWidget {
  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  ApiService apiService = ApiService(); // Ini akan sesuai dengan tipe
  late Future<List<PersonModel>> listData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = apiService.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP GET V2"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: listData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("loading..");
          } else {
            List<PersonModel> result = snapshot.data!;
            return ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(result[index].nama),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        result[index].email,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(result[index].quote),
                    ],
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(result[index].avatar),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

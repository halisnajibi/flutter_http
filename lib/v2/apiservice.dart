import 'dart:convert';

import 'package:flutter_http/v2/model/person.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<PersonModel>> getAllData() async {
    final response = await http.get(
      Uri.parse("https://6283762138279cef71d77f41.mockapi.io/api/v1/data2"),
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => PersonModel.formJson(data)).toList();
    } else {
      throw Exception('failed to load data');
    }
  }
}

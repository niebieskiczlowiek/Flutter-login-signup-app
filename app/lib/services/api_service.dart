import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String? apiUrl = dotenv.env['API_URL'];

  getUsers() async {
    final res = await http.get(Uri.parse("$apiUrl/users"));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  getUser(String username) async {}
  addUser(String username, String password) async {
    final res = await http.post(
      Uri.parse("$apiUrl/users"),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String> {
        "username": username,
        "password": password,
      }),
    );

    if (res.statusCode != 201) {
      throw Exception('Failed to add user');
    }
  }
}

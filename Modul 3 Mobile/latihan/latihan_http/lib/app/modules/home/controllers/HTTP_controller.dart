import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_http/app/data/models/api.dart'; // Sesuaikan dengan lokasi model Anda

Future<Welcome> fetchTodos() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));
  if (response.statusCode == 200) {
    return Welcome.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:modul2/app/data/Models/API.dart';

class HttpController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    fetchListItems();
  }

  Future<List<Result>> fetchListItems() async {
    try {
      final response = await http.get(
        Uri.parse("https://api.spoonacular.com/recipes/complexSearch?query=japanese&apiKey=64fc8eceff5d4461ae9b553d55ec46ff"),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey("results")) {
          List<dynamic> results = data["results"];
          // Map the results to List<Result> and return
          List<Result> resultList = results.map((item) => Result.fromJson(item)).toList();
          return resultList;
        } else {
          throw Exception("API response does not contain 'results' key.");
        }
      } else {
        throw Exception("Failed to fetch list items ${response.statusCode}");
      }
    } catch (e) {
      throw e;
    }
  }}
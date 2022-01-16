import 'package:http/http.dart' as http;
import '../models/category.dart';
import 'dart:convert' as convert;

class CategoryService {
  final String _url = "raw.githubusercontent.com";
  // final String _url = 'jsonplaceholder.typicode.com';
  Future<List<Category>> index() async {
    // Convert the url string into a https Uri
    final url = Uri.https(_url, '/muath-ye/public-json/father/category.json');
    // final url = Uri.https(_url, '/users');
    final resp = await http.get(url);

    // Get the decoded response data
    final List<dynamic> decodedData = convert.jsonDecode(resp.body);

    // Use the iterable map() to generate new User instances from the response
    return decodedData.map((e) => Category.fromJson(e)).toList();
  }
}

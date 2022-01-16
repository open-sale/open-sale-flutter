import 'package:http/http.dart' as http;
import '../models/product.dart';
import 'dart:convert' as convert;

class ProductService {
  final String _url = "raw.githubusercontent.com";
  // final String _url = 'jsonplaceholder.typicode.com';
  Future<List<Product>> index() async {
    // Convert the url string into a https Uri
    final url = Uri.https(_url, '/muath-ye/public-json/father/product.json');
    // final url = Uri.https(_url, '/users');
    final resp = await http.get(url);

    // Get the decoded response data
    final List<dynamic> decodedData = convert.jsonDecode(resp.body);

    // Use the iterable map() to generate new User instances from the response
    return decodedData.map((e) => Product.fromJson(e)).toList();
  }
}

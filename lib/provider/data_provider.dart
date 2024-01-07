import 'dart:convert';
import 'package:restful_api_practice/models/data_model.dart';
import 'package:http/http.dart' as http;

class DataApi {
  Future<List<Data>?> getAllData() async {
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/todos");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return dataFromJson(const Utf8Decoder().convert(response.bodyBytes));
    }
    return null;
  }
}

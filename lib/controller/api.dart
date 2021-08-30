import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapi_wallstreetjournal/model/model.dart';

Future<NewsModel> fetchNews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=PASTEYOURAPIHERE'),
  );

  if (response.statusCode == 200) {
    return NewsModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}

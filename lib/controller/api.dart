import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapi_wallstreetjournal/model/model.dart';

Future<NewsModel> fetchNews() async {
  final response = await http.get(
    Uri.parse(
        //TODO FIXME: Delete my api before git please!
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=1186c5f49a794aad8265af3ab9964ec7'),
  );

  if (response.statusCode == 200) {
    return NewsModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}

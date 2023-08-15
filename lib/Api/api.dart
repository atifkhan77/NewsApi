import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NewsApiHelper {
  final String url;

  NewsApiHelper(this.url);

  Future<List> fetchNewsArticles() async {
    List listResponse = [];

    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> mapResponse = json.decode(response.body);
        listResponse = mapResponse["articles"];
      } else {
        debugPrint("Error in loading news articles!");
      }
    } catch (e) {
      debugPrint("Error while fetching news articles: $e");
    }

    return listResponse;
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Api/api.dart';

class DetailedScreenProvider extends ChangeNotifier {
  final String url;
  late Future<List> newsArticles;

  DetailedScreenProvider(this.url) {
    newsArticles = fetchNewsArticles();
  }

  Future<List> fetchNewsArticles() async {
    List listResponse = [];

    try {
      // Fetch data using the NewsApiHelper
      NewsApiHelper apiHelper = NewsApiHelper(url);
      listResponse = await apiHelper.fetchNewsArticles();
    } catch (e) {
      debugPrint("Error while fetching news articles: $e");
    }

    return listResponse;
  }
}

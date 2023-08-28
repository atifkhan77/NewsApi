import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/newsModels.dart';
import 'package:flutter_application_1/Model/news_catagories.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class GetNewsApi with ChangeNotifier {
  String selectedCategory = 'General';
  CategoryNewsModel? categoryChanged;
  CategoryNewsModel? chanelChanged;
  NewsModel? generalNews;

  List categoriesList = [
    'General',
    'Health',
    'Sports',
    'Entertainment',
    'Business',
    'Technology'
  ];

  String getChangeCategoryNames(String categoryName) {
    selectedCategory = categoryName;
    notifyListeners();
    return selectedCategory;
  }

  Future<CategoryNewsModel> getChannelChangedNews(String channelName) async {
    String headlineUrl =
        'https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=e86c18ae5c54483aa37342f4e5972d24';
    final Response response = await http.get(Uri.parse(headlineUrl));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      debugPrint('THE RESPONSE COME ARE:');
      debugPrint(response.body);
      chanelChanged = CategoryNewsModel.fromJson(body);
      notifyListeners();
    }
    throw Exception('Error occure within getHeadlineMethod');
  }

  Future<CategoryNewsModel> getCategoryNews(String category) async {
    String categoryUrl =
        'https://newsapi.org/v2/everything?q=$category&apiKey=e86c18ae5c54483aa37342f4e5972d24';
    final Response response = await http.get(Uri.parse(categoryUrl));
    if (response.statusCode == 200) {
      debugPrint('API GET ARE:: ${response.body}');
      final body = jsonDecode(response.body);
      var categoryNews = CategoryNewsModel.fromJson(body);
      categoryChanged = categoryNews;
      notifyListeners();

      return categoryNews;
    }
    throw Exception('Error occure within getCategory method');
  }
}

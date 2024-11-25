import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:sample_news_app/model/home_screen_model.dart';

class HomeScreenController with ChangeNotifier {
  List<Article>? articlesList = [];
  bool isLoading = false;
  getNews(String category) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=37cd22cee6d14bf78b9a3cfed10783c7");
    try {
      isLoading = true;
      notifyListeners();
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = homemodelFromJson(response.body);
        print(jsonData);

        articlesList = jsonData.articles ?? [];
        print(articlesList);
        log(articlesList.toString());
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}

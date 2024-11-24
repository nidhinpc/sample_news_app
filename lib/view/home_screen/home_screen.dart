import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_news_app/controller/home_screen_controller.dart';
import 'package:sample_news_app/model/home_screen_model.dart';
import 'package:sample_news_app/utils/color_constants.dart';
import 'package:sample_news_app/utils/image_constants.dart';
import 'package:sample_news_app/view/dumydb/dummydb.dart';

import 'package:sample_news_app/view/global_screen/widget_news_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<Article> savedArticles = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeScreenController>().getNews(Dummydb.categories[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Dummydb.categories.length,
      child: Scaffold(
        backgroundColor: ColorConstants.PrimaryColor,
        appBar: AppBar(
          backgroundColor: ColorConstants.BackgroundColor,
          leading: Container(
            height: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstants.mainLogo),
                    fit: BoxFit.cover)),
          ),
          title: Text(
            'NEWS WORLD',
            style: TextStyle(
                color: ColorConstants.TextColor, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            labelStyle: TextStyle(color: ColorConstants.TextColor),
            unselectedLabelStyle: TextStyle(color: ColorConstants.SubTextColor),
            indicatorWeight: 6,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.ButtonColor),
            isScrollable: true,
            tabs: Dummydb.categories
                .map((category) => Tab(text: category))
                .toList(),
            onTap: (index) {
              context
                  .read<HomeScreenController>()
                  .getNews(Dummydb.categories[index]);
            },
          ),
        ),
        body: TabBarView(
          children: Dummydb.categories.map((category) {
            return FutureBuilder(
              future: context.read<HomeScreenController>().getNews(category),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                      child: Text('Error loading news for $category'));
                }

                final articles =
                    context.watch<HomeScreenController>().articlesList;

                if (articles == null || articles.isEmpty) {
                  return Center(child: Text('No news found for $category'));
                }

                return NewsSection(
                  articles: articles,
                  savedArticles: savedArticles,
                  onSavePressed: (article) {
                    if (savedArticles.contains(article)) {
                      savedArticles.remove(article);
                    } else {
                      savedArticles.add(article);
                      print(savedArticles);
                    }
                    setState(() {});
                  },
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

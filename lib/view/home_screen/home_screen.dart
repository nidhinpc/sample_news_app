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
  final TextEditingController _searchController = TextEditingController();
  String currentCategory = Dummydb.categories[0];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<HomeScreenController>().getNews(currentCategory);
    });

    _searchController.addListener(() {
      context
          .read<HomeScreenController>()
          .searchArticles(_searchController.text);
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
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            'NEWS WORLD',
            style: TextStyle(
              color: ColorConstants.TextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            labelStyle: TextStyle(color: ColorConstants.TextColor),
            unselectedLabelStyle: TextStyle(color: ColorConstants.SubTextColor),
            indicatorWeight: 6,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.ButtonColor,
            ),
            isScrollable: true,
            tabs: Dummydb.categories
                .map((category) => Tab(text: category))
                .toList(),
            onTap: (index) {
              setState(() {
                currentCategory = Dummydb.categories[index];
                _searchController.clear();
              });
              context
                  .read<HomeScreenController>()
                  .getNews(Dummydb.categories[index]);
            },
          ),
        ),
        body: Column(
          children: [
            // Search TextField
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search news...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
            // TabBarView to display news
            Expanded(
              child: Consumer<HomeScreenController>(
                builder: (context, controller, child) {
                  final articles = controller.filteredArticles;

                  if (controller.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (articles == null || articles.isEmpty) {
                    return Center(
                      child: Text('No news found for $currentCategory'),
                    );
                  }

                  return NewsSection(
                    articles: articles,
                    savedArticles: savedArticles,
                    onSavePressed: (article) {
                      setState(() {
                        if (savedArticles.contains(article)) {
                          savedArticles.remove(article);
                        } else {
                          savedArticles.add(article);
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sample_news_app/model/home_screen_model.dart';
import 'package:sample_news_app/utils/color_constants.dart';

import 'package:sample_news_app/view/news_details_screen/news_details_screen.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({
    super.key,
    required this.articles,
    required this.savedArticles,
    required this.onSavePressed,
  });

  final List<Article> articles;
  final List<Article> savedArticles;
  final Function(Article) onSavePressed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsScreen(
                        index: index,
                        saved: savedArticles,
                      ),
                    ),
                  );
                },
                child: article.urlToImage == null
                    ? SizedBox()
                    : Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(4)),
                          image: DecorationImage(
                            image: NetworkImage(article.urlToImage.toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
              ListTile(
                title: Text(
                  article.title ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  article.description ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  icon: Icon(
                    savedArticles.contains(article)
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: savedArticles.contains(article)
                        ? ColorConstants.AccentTextColor
                        : null,
                  ),
                  onPressed: () => onSavePressed(article),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

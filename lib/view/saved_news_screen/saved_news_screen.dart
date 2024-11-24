import 'package:flutter/material.dart';
import 'package:sample_news_app/model/home_screen_model.dart';
import 'package:sample_news_app/utils/color_constants.dart';
import 'package:sample_news_app/utils/image_constants.dart';
import 'package:sample_news_app/view/news_details_screen/news_details_screen.dart';

class SavedNewsScreen extends StatefulWidget {
  final List<Article>? saved;
  final bool? premiumUser;

  SavedNewsScreen({Key? key, this.saved, this.premiumUser}) : super(key: key);

  @override
  State<SavedNewsScreen> createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {
  List<Article> savedArticles = [];
  bool _isPremium = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        savedArticles = widget.saved ?? [];
        _isPremium = widget.premiumUser ?? false;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'SAVED NEWS',
          style: TextStyle(
            color: ColorConstants.TextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _isPremium
          ? (savedArticles.isEmpty
              ? Center(
                  child: Text(
                    'No saved articles yet!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.TextColor,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: savedArticles.length,
                  itemBuilder: (context, index) {
                    final article = savedArticles[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          article.title ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.TextColor,
                          ),
                        ),
                        subtitle: Text(
                          article.description ?? "",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NewsDetailsScreen(index: index),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    size: 100,
                    color: Colors.grey.shade500,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Upgrade to Premium to view saved articles.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.TextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.SecondaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: Text(
                      "Upgrade to Premium",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // void _upgradeToPremium() {
  //   setState(() {
  //     _isPremium = true;
  //   });

  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Text("You've successfully upgraded to Premium!"),
  //     duration: Duration(seconds: 2),
  //   ),
  // );
//   }
}

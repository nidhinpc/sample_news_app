import 'package:flutter/material.dart';
import 'package:sample_news_app/utils/color_constants.dart';
import 'package:sample_news_app/utils/image_constants.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.PrimaryColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.BackgroundColor,
        title: Text(
          'ABOUT US',
          style: TextStyle(
              color: ColorConstants.TextColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.mainLogo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // About Text
            Text(
              'Welcome to News World!',
              style: TextStyle(
                color: ColorConstants.TextColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              '''
News World is your one-stop platform for the latest updates, breaking stories, and insights from around the globe. 

Our mission is to deliver accurate, timely, and engaging news to keep you informed.

Thank you for being part of our journey!
              ''',
              style: TextStyle(
                color: ColorConstants.TextColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            // Contact Us Section
            Text(
              'Contact Us:',
              style: TextStyle(
                color: ColorConstants.TextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'support@newsworld.com',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

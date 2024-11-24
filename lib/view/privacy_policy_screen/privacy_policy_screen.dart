import 'package:flutter/material.dart';
import 'package:sample_news_app/utils/color_constants.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.PrimaryColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.BackgroundColor,
        title: Text(
          'PRIVACY POLICY',
          style: TextStyle(
              color: ColorConstants.TextColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''
At News World, we prioritize your privacy. This policy outlines how we collect, use, and protect your data.

1. **Data Collection**: 
   - We collect your name, email, and preferences to enhance your experience.

2. **Data Usage**: 
   - Your information is used for personalized content and feature updates.

3. **Data Sharing**: 
   - We do not share your personal information with third parties.

4. **Cookies**: 
   - We use cookies to improve functionality and analytics.

For more details, contact us at support@newsworld.com.
            ''',
            style: TextStyle(
              color: ColorConstants.TextColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

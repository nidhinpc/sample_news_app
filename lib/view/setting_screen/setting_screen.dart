import 'package:flutter/material.dart';
import 'package:sample_news_app/utils/color_constants.dart';
import 'package:sample_news_app/utils/image_constants.dart';
import 'package:sample_news_app/view/about_us_screen/about_us_screen.dart';
import 'package:sample_news_app/view/privacy_policy_screen/privacy_policy_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationsEnabled = true;
  bool isDarkModeEnabled = false;

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
          'SETTINGS',
          style: TextStyle(
              color: ColorConstants.TextColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Settings
            ListTile(
              leading: Icon(
                Icons.person,
                color: ColorConstants.ButtonColor,
              ),
              title: Text(
                'Profile Settings',
                style: TextStyle(
                    color: ColorConstants.ButtonTextColor, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: ColorConstants.ButtonColor),
              onTap: () {
                // Navigate to profile settings
              },
            ),
            Divider(),
            // Notifications
            SwitchListTile(
              activeColor: ColorConstants.ButtonColor,
              title: Text(
                'Enable Notifications',
                style: TextStyle(
                    color: ColorConstants.ButtonTextColor, fontSize: 20),
              ),
              value: isNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationsEnabled = value;
                });
              },
            ),
            Divider(),
            // Dark Mode
            SwitchListTile(
              activeColor: ColorConstants.ButtonColor,
              title: Text(
                'Enable Dark Mode',
                style: TextStyle(
                    color: ColorConstants.ButtonTextColor, fontSize: 20),
              ),
              value: isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  isDarkModeEnabled = value;
                });
              },
            ),
            Divider(),

            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: ColorConstants.ButtonColor,
              ),
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                    color: ColorConstants.ButtonTextColor, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: ColorConstants.ButtonColor),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPolicyScreen(),
                    ));
              },
            ),
            Divider(),

            ListTile(
              leading: Icon(
                Icons.info,
                color: ColorConstants.ButtonColor,
              ),
              title: Text(
                'About Us',
                style: TextStyle(
                    color: ColorConstants.ButtonTextColor, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: ColorConstants.ButtonColor),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUsScreen(),
                    ));
              },
            ),
            Divider(),

            ListTile(
              leading: Icon(
                Icons.arrow_back,
                color: ColorConstants.ButtonColor,
              ),
              title: Text(
                'Back',
                style: TextStyle(
                    color: ColorConstants.ButtonTextColor, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

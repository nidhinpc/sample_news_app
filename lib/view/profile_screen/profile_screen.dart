import 'package:flutter/material.dart';
import 'package:sample_news_app/utils/color_constants.dart';
import 'package:sample_news_app/utils/image_constants.dart';
import 'package:sample_news_app/view/setting_screen/setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String name;

  final bool? premium;
  ProfileScreen({Key? key, required this.name, this.premium}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isPremium = false;
  late String _name;

  @override
  void initState() {
    _name = widget.name;
    isPremium = widget.premium ?? false;
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
                  fit: BoxFit.cover)),
        ),
        title: Text(
          'PROFILE',
          style: TextStyle(
              color: ColorConstants.TextColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 110,
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(color: ColorConstants.TextColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, size: 40),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _name,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      if (isPremium)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 5),
                            Text('Premium User',
                                style: TextStyle(color: Colors.amber)),
                          ],
                        ),
                      if (!isPremium)
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ColorConstants.SecondaryColor)),
                          onPressed: () {},
                          child: Text('Upgrade to Premium'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: ColorConstants.ButtonColor,
              ),
              title: Text('Settings',
                  style: TextStyle(
                      color: ColorConstants.ButtonTextColor, fontSize: 20)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: ColorConstants.ButtonColor,
              ),
              title: Text('Logout',
                  style: TextStyle(
                      color: ColorConstants.ButtonTextColor, fontSize: 20)),
              onTap: () {
                Navigator.pushReplacementNamed(context, "");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("You have successfully logged out."),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

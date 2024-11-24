import 'package:flutter/material.dart';
import 'package:sample_news_app/view/home_screen/home_screen.dart';
import 'package:sample_news_app/view/profile_screen/profile_screen.dart';
import 'package:sample_news_app/view/saved_news_screen/saved_news_screen.dart';

class MainScreen extends StatefulWidget {
  final String email;
  final bool isPremium;

  const MainScreen({super.key, required this.email, required this.isPremium});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late String email;
  late bool isPremium;
  @override
  void initState() {
    email = widget.email;
    isPremium = widget.isPremium;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomeScreen(),
      SavedNewsScreen(
        premiumUser: isPremium,
      ),
      ProfileScreen(
        name: email,
        premium: isPremium,
      ),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

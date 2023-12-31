import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hantaton_app/feature/home/ui/create_event.dart';
import 'package:hantaton_app/feature/auth/ui/user_screen.dart';
import 'package:hantaton_app/feature/home/ui/home_screen.dart';


import '../../home/ui/like_category.dart';
import 'chat_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _rootBody(_selectedIndex),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateEvent()));
      },
        backgroundColor: Colors.yellow.shade700,
      child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Colors.black,
        activeColor: Colors.yellow.shade700,
        icons: const <IconData>[
          Icons.home,
          CupertinoIcons.heart_solid,
          Icons.notifications,
          Icons.account_circle,
        ],
        activeIndex: _selectedIndex,
        hideAnimationCurve: Curves.easeOut,
        gapLocation: GapLocation.center,
        leftCornerRadius: 5,
        rightCornerRadius: 5,
        onTap: (index) => setState(() => _selectedIndex = index),
        //other params
      ),
    );
  }
  Widget _rootBody(int selectedIndex){
    switch(selectedIndex){
      case 0:
        return const HomeScreen();
      case 1:
        return  LikeCategory();
      case 2:
        return const ChatScreen();
      case 3:
        return UserScreen();
      default:
        return const HomeScreen();
    }

  }
}


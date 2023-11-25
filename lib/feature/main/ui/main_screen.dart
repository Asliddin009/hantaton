import 'package:flutter/material.dart';
import 'package:hantaton_app/feature/auth/ui/user_screen.dart';
import 'package:hantaton_app/feature/main/ui/home_screen.dart';
import 'package:hantaton_app/feature/main/ui/search_screen.dart';

import 'chat_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _rootBody(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon:Icon(Icons.home,color: Colors.orange,),label: ""),
          BottomNavigationBarItem(icon:Icon(Icons.search,color: Colors.orange,),label: ""),
          BottomNavigationBarItem(icon:Icon(Icons.chat,color: Colors.orange,),label: ""),
          BottomNavigationBarItem(icon:Icon(Icons.person_outlined,color: Colors.orange,),label: ""),

        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Theme.of(context).,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget _rootBody(int selectedIndex){
    switch(selectedIndex){
      case 0:
        return const HomeScreen();
      case 1:
        return  SearchScreen();
      case 2:
        return const ChatScreen();
      case 3:
        return UserScreen();
      default:
        return const HomeScreen();
    }

  }
}


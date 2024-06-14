import 'package:flutter/material.dart';
import 'package:flutter_application_1/Chat_screen.dart';
import 'package:flutter_application_1/FriendListScree.dart';
import 'package:flutter_application_1/ProfileFirebase.dart';
import 'package:flutter_application_1/NewsFeedPage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    ProfileFireBase(),
    FriendListScreen(),
    ChatScreen(),
    NewsFeedPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Список пользователей',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Чат',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Лента новостей',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

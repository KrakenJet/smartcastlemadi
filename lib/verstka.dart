import 'package:flutter/material.dart';
import 'package:flutter_application_1/category_screen.dart';
import 'package:flutter_application_1/lesson6.dart';
import 'package:flutter_application_1/recept_screen.dart';
import 'package:flutter_application_1/weather_api.dart';

class verstka extends StatefulWidget {
  const verstka({super.key});

  @override
  State<verstka> createState() => _verstkaState();
}

class _verstkaState extends State<verstka> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //centerTitle: true,
      //title: Text('Прогрессивная верстка',
      //style: TextStyle(fontSize: 20, color: Colors.white)),
      //backgroundColor: Colors.blue),
      body: Center(
          child: IndexedStack(
        index: selectedIndex,
        children: [
          lesson6(),
          categoryScreen(),
          ReceptScreen(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.slow_motion_video_rounded), label: 'Фильмы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded), label: 'Магазин'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'Рецепты'),
        ],
        currentIndex:
            selectedIndex, //переход в bottombarnavigation между иконками
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}

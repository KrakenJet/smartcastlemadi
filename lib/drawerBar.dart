import 'package:flutter/material.dart';
import 'package:flutter_application_1/catalog.dart';
import 'package:flutter_application_1/lesson4.dart';
import 'package:flutter_application_1/lesson6.dart';
import 'package:flutter_application_1/news.dart';
import 'package:flutter_application_1/recept_screen.dart';
import 'package:flutter_application_1/ricky_page.dart';
import 'package:flutter_application_1/weather_api.dart';

class drawerBar extends StatefulWidget {
  const drawerBar({super.key});

  @override
  State<drawerBar> createState() => _drawerBarState();
}

class _drawerBarState extends State<drawerBar> {

  int selectedIndex = 0;
  List<Widget> widgets =[
    lesson6(),
    ReceptScreen(),
    weather_api(),
    catalog(),
    ricky_page()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Боковое меню',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          backgroundColor: Colors.blue),
          body: widgets[selectedIndex],
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
        DrawerHeader(
          curve: Curves.elasticInOut,
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(child: Text('БУРГЕР')),
            ),
            ListTile(
              leading: Icon(Icons.movie_creation_outlined),
              title: Text('Все фильмы'),
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pop(context);
              },
              
            ),
             ListTile(
              leading: Icon(Icons.restaurant_menu),
              title: Text('Меню'),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pop(context);
              },
              
            ),
             ListTile(
              leading: Icon(Icons.wrap_text_sharp),
              title: Text('Погода'),
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.pop(context);
              },
              
            ),
             ListTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text('Магазин'),
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
                Navigator.pop(context);
              },
              
            ),
             ListTile(
              leading: Icon(Icons.person),
              title: Text('Рик и морти'),
              onTap: () {
                setState(() {
                  selectedIndex = 4;
                });
                Navigator.pop(context);
              },
              
            )
      ])),
    );
  }
}

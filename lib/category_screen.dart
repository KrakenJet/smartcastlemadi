import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/country_model.dart';
import 'package:flutter_application_1/products_screen.dart';
import 'package:flutter_application_1/ricky_info.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/ricky_model.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class categoryScreen extends StatefulWidget {
  categoryScreen({super.key});

  @override
  State<categoryScreen> createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  List<String> categories = [];

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  Future getCategories() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories'));

    if (response.statusCode == 200) {
      setState(() {
        categories = List.from(jsonDecode(
            response.body)); //ЧТОБЫ ДЕКОДИРОВАТЬ МАССИВ БЕЗ МОДЕЛЬКИ\NO MODEL
      });
    }
  }

  String capitalize(String word) {
    return word.substring(0, 1).toUpperCase() +
        word.substring(1); //ПЕРЕНЕСТИ\ПЕРЕДАТЬ СЛОВА С БОЛЬШОЙ БУКВЫ UPPERCASE
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Categories',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            centerTitle: true),
        body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => productsScreen(
                                categoryName: capitalize(categories[index]),
                              )));
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 2, 87, 156)),
                    child: Text(
                      capitalize(categories[index]),
                      style: TextStyle(fontSize: 40, color: Colors.orange),
                      textAlign: TextAlign.center,
                    )),
              ),
            );
          },
        ));
  }
}

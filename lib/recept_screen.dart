import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/recept_details.dart';
import 'package:flutter_application_1/recipeKatalog.dart';
import 'package:http/http.dart' as http;

class ReceptScreen extends StatefulWidget {
  const ReceptScreen({super.key});

  @override
  State<ReceptScreen> createState() => _ReceptScreenState();
}

class _ReceptScreenState extends State<ReceptScreen> {
  List<Recipes> recipes = [];
  @override
  void initState() {
    super.initState();
    getRecepts();
  }

  Future getRecepts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));

    if (response.statusCode == 200) {
      recipe Recipe = recipe.fromJson(jsonDecode(response
          .body)); // сначала название другого файла, потом название переменной(любое), равно название другого файла.Json

      setState(() {
        recipes = Recipe
            .recipes!; //recipes = название массива внутри другого файла, Recipe название переменной, recipes! = название массива внутри объекта
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Рецепты',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => recept_details(
                                name: recipes[index].name!,
                                rating: recipes[index].rating!,
                                ingredients: recipes[index].ingredients!,
                                instructions: recipes[index].instructions!,
                                image: recipes[index].image!,
                              )));
                },
                child: Column(
                  children: [
                    Image.network(recipes[index].image!),
                    Text(recipes[index].name!, style: TextStyle(fontSize: 20))
                  ],
                ),
              );
            }));
  }
}

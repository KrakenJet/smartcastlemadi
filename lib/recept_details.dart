import 'package:flutter/material.dart';
import 'package:flutter_application_1/recipeKatalog.dart';

class recept_details extends StatefulWidget {
  String name;
  dynamic rating;
  List<String> ingredients;
  List<String> instructions;
  String image;

  recept_details(
      {super.key,
      required this.name,
      required this.rating,
      required this.ingredients,
      required this.instructions,
      required this.image});

  @override
  State<recept_details> createState() => _recept_detailsState();
}

class _recept_detailsState extends State<recept_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,
            style: TextStyle(fontSize: 20, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(widget.image),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Text(widget.rating.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.black87)),
                ],
              ),
              for (String instructions in widget.instructions)
                Text(instructions, style: TextStyle(fontSize: 25)),
              for (String ingredients in widget.ingredients)
                Text(ingredients, style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}

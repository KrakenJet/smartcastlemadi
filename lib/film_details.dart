import 'package:flutter/material.dart';

class FilmDetails extends StatefulWidget {
  String image;
  String name;
  String genre;
  double rating;
  String desc;

   FilmDetails({super.key, 
   required this.image, 
   required this.name, 
   required this.genre, 
   required this.rating,
   required this.desc
   });

  @override
  State<FilmDetails> createState() => _FilmDetailsState();
}

class _FilmDetailsState extends State<FilmDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text('О фильме')),
          backgroundColor: Colors.green),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Image.network(
              widget.image,
              width: 400,
              height: 400,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Название:  ',),
              Text(widget.name, style: TextStyle(fontSize: 20)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Жанр:  '),
              Text(widget.genre, style: TextStyle(fontSize: 20)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Рейтинг:  '),
              Text(widget.rating.toString(), style: TextStyle(fontSize: 20)),
            ],
          ),
          SizedBox(height: 10),
          Text('Описание:  '),
          Text(widget.desc, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}

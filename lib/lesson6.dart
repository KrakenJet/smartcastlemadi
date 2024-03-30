import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/film_details.dart';

class lesson6 extends StatelessWidget {
  lesson6({super.key});

  List<Movie> movies = [
    Movie(
        'Аватар',
        'https://upload.wikimedia.org/wikipedia/ru/4/4b/Avatar-2009.jpg',
        'Приключение',
        9.0,
        'полное описание фильма'),
    Movie(
        'Гарри Поттер',
        'https://upload.wikimedia.org/wikipedia/ru/b/b4/Harry_Potter_and_the_Philosopher%27s_Stone_%E2%80%94_movie.jpg',
        'Фантастика',
        7.8,
        'Мальчик в очках против лысого'),
    Movie(
        'Мадагаскар',
        'https://sun9-72.userapi.com/impg/iKMhsVHE-7j0WQOdYNCIi8cKL5RVLk-5NcDGKQ/dmEwQ2eG_7U.jpg?size=403x604&quality=96&sign=baf49af2e6d51925e485b08b0a6d2a05&type=album',
        'Мультфильм',
        6.4,
        'Крутой мульт'),
    Movie(
        'Троя',
        'https://upload.wikimedia.org/wikipedia/ru/0/07/Troy-poster.jpg',
        'Боевик',
        5.6,
        'История'),
    Movie(
        'Человек паук',
        'https://avatars.mds.yandex.net/get-kinopoisk-image/6201401/731c4031-7389-44f4-8c15-f9f4e3b0ed90/600x900',
        'Комиксы',
        8.9,
        'Пауко-человек'),
    Movie(
        'Оно',
        'https://upload.wikimedia.org/wikipedia/ru/thumb/d/d5/ItDVD.jpg/274px-ItDVD.jpg',
        'Ужасы',
        5.4,
        'Стремный клоун'),
    Movie(
        'Астрал',
        'https://upload.wikimedia.org/wikipedia/ru/thumb/6/61/Insidious_2011.jpg/200px-Insidious_2011.jpg',
        'Триллер',
        9.9,
        'Ужастик про домового'),
    Movie(
        'Жизнь Саи',
        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8800f9e3-0897-4e75-bbd4-a3823c211dea/dag5ot6-e610a360-149c-45f3-b475-15d238e4cf3e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzg4MDBmOWUzLTA4OTctNGU3NS1iYmQ0LWEzODIzYzIxMWRlYVwvZGFnNW90Ni1lNjEwYTM2MC0xNDljLTQ1ZjMtYjQ3NS0xNWQyMzhlNGNmM2UucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.vwmv1aMTPQxEHhqE3N6gnOM98RG8aNwkkbRxgGfrGkA',
        'Романтика',
        10.10,
        'МЯСО')
  ];

  var ratingColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 48, 45, 45),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 128, 255),
          title: Center(
              child: Text('Фильмы',
                  style: TextStyle(fontSize: 20, color: Colors.white))),
        ),
        body: ListView.builder(
            itemCount: movies.length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              if (movies[index].rating > 7) {
                ratingColor = Colors.green;
              } else {
                ratingColor = Colors.grey;
              }
              ;
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FilmDetails(
                                image: movies[index].image,
                                name: movies[index].name,
                                genre: movies[index].genre,
                                rating: movies[index].rating,
                                desc: movies[index].desc)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Row(
                      children: [
                        Image.network(movies[index].image,
                            width: 100, height: 100),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(movies[index].name,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.blue)),
                            Text(movies[index].genre,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            Text(movies[index].rating.toString(),
                                style: TextStyle(
                                    fontSize: 15, color: ratingColor)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}

class Movie {
  String name;
  String image;
  String genre;
  double rating;
  String desc;

  Movie(this.name, this.image, this.genre, this.rating, this.desc);
}

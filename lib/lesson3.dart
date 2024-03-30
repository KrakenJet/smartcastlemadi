

import 'package:flutter/material.dart';

class Lesson3 extends StatefulWidget {
  const Lesson3({super.key});

  @override
  State<Lesson3> createState() => _Lesson3State();
}

class _Lesson3State extends State<Lesson3> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(centerTitle: true, 
      backgroundColor: Colors.blue, 
      title: Text('Информация о фильме', 
      style: TextStyle(fontSize: 24, color: Colors.white),
      )),
      body: Column(
        children: [SizedBox(height: 50), Center(child: Image.network('https://cubiq.ru/wp-content/uploads/2019/08/The_Longest_Journey.jpg', width: 200, height: 200)), 
      SizedBox(height: 50), 
      Text('Название фильма: Загадочное приключение', style: TextStyle(color: Colors.blue, fontSize: 22)),

      Row(
        children: [
          Text('Режиссер: ', style: TextStyle(color: Colors.grey)), 
          Text('Квентин Тарантино', style: TextStyle(color: Colors.black)), SizedBox(width: 10), 
          Text('Год выпуска: ', style: TextStyle(color: Colors.grey)),
          Text('2023', style: TextStyle(color: Colors.black)),
        ],
      ), 
      Text('Описание: Длинное и увлекательное описание фильма, рассказывающее о его сюжете и интересных персонажах.', 
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green)), 
      RichText(
        text: TextSpan(
          children: <TextSpan>[



          TextSpan(text: 'Рейтинг: ', style: TextStyle(color: Colors.grey)),
          TextSpan(text: '4.5/5', style: TextStyle(color: Colors.amber)),

          
          
          
          ]
      ))]
      )
);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_1/newsAPI.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/info2.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class news extends StatefulWidget {
  news({super.key});

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  List<Articles>? articles;
  String authorFromServer = '';
  DateTime? publishedAt;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  Future getNews() async {
    final response3 = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?apiKey=d14db04d12c348a6bac286ea1cd84620&language=ru'));

        if (response3.statusCode == 200){
          newsAPI news = newsAPI.fromJson(jsonDecode(response3.body));

          setState(() {
        articles = news.articles;
      });
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('News'),
          backgroundColor: Colors.amber,
          centerTitle: true),
      body: ListView.builder(
          itemCount: articles!.length,
          itemBuilder: (context, Index) {
            return Padding(
                padding: EdgeInsets.all(10.0), child: Column(
                  children: [
                    Text(articles![Index].title!),
                    Text(articles![Index].author!),
                    Text(
                      DateFormat('dd.MM.yyyy').format(DateTime.parse(articles![Index].publishedAt!))),
                  ],
                ));
          }),
    );
  }
}

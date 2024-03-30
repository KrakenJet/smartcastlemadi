import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ricky_info.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/ricky_model.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ricky_page extends StatefulWidget {
  ricky_page({super.key});

  @override
  State<ricky_page> createState() => _ricky_pageState();
}

class _ricky_pageState extends State<ricky_page> {
  List<Results> rickies = [];
  int? page;

  bool? loading = false;
  @override
  void initState() {
    getRickies();
    super.initState();
  }

  Future getRickies() async {
    page = 1;
    final response = await http.get(Uri.parse(
        'https://rickandmortyapi.com/api/character?page=$page')); //ОБНОВЛЕНИЕ СТРАНИЦЫ ДЛЯ НОВЫХ КАТЕГОРИЙ

    if (response.statusCode == 200) {
      RickyModel rickyResponse = RickyModel.fromJson(jsonDecode(response.body));

      setState(() {
        rickies = rickyResponse.results!;
      });
    }
  }

  Future getMoreRickies() async {
    setState(() {
      loading = true;
    });
    page = page! + 1;
    final response = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/character?page=$page'));

    if (response.statusCode == 200) {
      RickyModel rickyResponse = RickyModel.fromJson(jsonDecode(response.body));

      setState(() {
        rickies += rickyResponse.results!;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('"Rick and Morty characters"',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(33, 150, 243, 1)),
        body: LazyLoadScrollView(
          onEndOfPage: () {
            getMoreRickies();
          },
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Поиск',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onChanged: (value) async {
                    print(value);

                    final response = await http.get(Uri.parse(
                        'https://rickandmortyapi.com/api/character?page=1&name=$value'));
                    if (response.statusCode == 200) {
                      RickyModel rickyResponse =
                          RickyModel.fromJson(jsonDecode(response.body));

                      setState(() {
                        rickies = rickyResponse.results!;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: rickies.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => rickyInfo(
                                    name: rickies[index].name!,
                                    status:  rickies[index].status!,
                                    image:  rickies[index].image,
                                    location: rickies[index].location!.name!,
                                    gender: rickies[index].gender!,
                                    species: rickies[index].species!,
                                  )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Row(
                              children: [
                                Image.network(rickies[index].image!,
                                    width: 150, height: 150),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(rickies[index].name!,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        rickies[index].location!.name!,
                                        style: TextStyle(fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        rickies[index].gender!,
                                        style: TextStyle(fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(rickies[index].status!,
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.center)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: loading == true
                      ? Center(child: CircularProgressIndicator())
                      : Container()) //Загрузка
            ],
          ),
        ));
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/country_model.dart';
import 'package:flutter_application_1/ricky_info.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/ricky_model.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class countryScreen extends StatefulWidget {
  countryScreen({super.key});

  @override
  State<countryScreen> createState() => _countryScreenState();
}

class _countryScreenState extends State<countryScreen> {
  List<CountryModel> countries = [];

  @override
  void initState() {
    getCountries();
    super.initState();
  }

  Future getCountries() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      List<CountryModel> countryList = List.from(jsonDecode(response.body))
          .map((map) => Map<String, dynamic>.from(map))
          .map((Map<String, dynamic> map) => CountryModel.fromJson(map))
          .toList();

      setState(() {
        countries = countryList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(43, 51, 84, 1),
        appBar: AppBar(
          title: Text('Countries',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(43, 51, 84, 1),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'Поиск',
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
                onChanged: (value) async {
                  final response = await http.get(
                      Uri.parse('https://restcountries.com/v3.1/name/$value'));

                  if (response.statusCode == 200) {
                    List<CountryModel> countryList =
                        List.from(jsonDecode(response.body))
                            .map((map) => Map<String, dynamic>.from(map))
                            .map((Map<String, dynamic> map) =>
                                CountryModel.fromJson(map))
                            .toList();

                    setState(() {
                      countries = countryList;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(34, 43, 72, 1),
                          borderRadius: BorderRadius.circular(16)),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: Colors.white),
                        child: ExpansionTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(countries[index].flags!.png!),
                          ),
                          title: Text(countries[index].name!.common!,
                              style: TextStyle(color: Colors.white)),
                          children: [
                            Text('Capital: ${countries[index].capital!.first}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                            Text(
                                'Population: ${countries[index].population!} people',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                            Text('Area in km^2: ${countries[index].area!}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

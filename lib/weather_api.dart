import 'package:flutter/material.dart';
import 'package:flutter_application_1/weatherPage.dart';
import 'package:flutter_application_1/weather_model.dart';
import 'package:http/http.dart' as http;

class weather_api extends StatefulWidget {
  weather_api({super.key});

  @override
  State<weather_api> createState() => _weather_apiState();
}

class _weather_apiState extends State<weather_api> {

TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Прогноз погоды',
              style: TextStyle(fontSize: 22, color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue),
      body: Column(children: [
        TextFormField(
          controller: cityController,
          decoration: InputDecoration(hintText: 'Введите название города'),
        ),
        SizedBox(height: 20),
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => weatherPage(CityName: cityController.text)));
        }, child: Text('Получить погоду'))
      ]),
    );
  }
}

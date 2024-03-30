import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/weather_model.dart';

class weatherPage extends StatefulWidget {
  String? CityName;

  weatherPage({super.key, required this.CityName});

  @override
  State<weatherPage> createState() => _weatherPageState();
}

class _weatherPageState extends State<weatherPage> {
  List<Weather>? weather;
  double temp = 0.0;
  String status = '';
  String statusImage = '';
  @override
  void initState() {
    getWeather();
    super.initState();
  }

  Future getWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${widget.CityName}&appid=1369dd6b5ae78fc9952261ab9aa236b4&units=metric'));

    if (response.statusCode == 200) {
      weather_model weatherResponse =
          weather_model.fromJson(jsonDecode(response.body));

      setState(() {
        temp = weatherResponse.main!.temp!;
        status = weatherResponse.weather!.first.main!;
        if(status == 'Clouds'){
statusImage = 'assets/CloudsSeason.jpg';
        } else if (status == 'Rain'){
statusImage = 'assets/rainySeason.jpg';
        } else if (status == 'Snow'){
          statusImage = 'assets/SnowySeason.jpg';
        }
      });
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 5),
          backgroundColor: Colors.amber,
          content: Text(jsonDecode(response.body)['message'], style: TextStyle(fontSize: 20))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Погода в ${widget.CityName.toString()}',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(statusImage),
            Text(widget.CityName.toString(), style: TextStyle(fontSize: 50)),
            Text('${temp.toString()}°C',
                style: TextStyle(fontSize: 36)),
            SizedBox(height: 20),
            Text(status, style: TextStyle(fontSize: 36))
          ],
        ),
      ),
    );
  }
}

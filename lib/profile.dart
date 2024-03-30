import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  String login;
  String name;
  String surname;
  String secondName;
  String city;
  String number;
  String email;

  Profile({super.key, required this.login, 
  required this.name, required this.surname, required this.secondName, 
  required this.city, required this.number, required this.email});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Профиль'),
        backgroundColor: Color.fromARGB(255, 0, 200, 113),
      ),
      body: Column(
        children: [
          Text(widget.name, style: TextStyle(fontSize: 20)),
          Text(widget.surname, style: TextStyle(fontSize: 20)),
          Text(widget.secondName, style: TextStyle(fontSize: 20)),
          Text(widget.login, style: TextStyle(fontSize: 20)),
          Text(widget.city, style: TextStyle(fontSize: 20)),
          Text(widget.number)
        
        ],
      ),
    );
  }
}

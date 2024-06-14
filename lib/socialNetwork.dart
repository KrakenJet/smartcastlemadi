import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/ProfileFirebase.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/profilehomework.dart';
import 'package:flutter_application_1/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class socialNetwork extends StatefulWidget {
  const socialNetwork({super.key});

  @override
  State<socialNetwork> createState() => _socialNetworkState();
}

class _socialNetworkState extends State<socialNetwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Регистрация',
          
              style: TextStyle(color: Colors.white, fontSize: 20)),
          centerTitle: true,
          backgroundColor: Colors.blue),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Добро пожаловать', style: TextStyle(fontSize: 35)),
          Text('войдите в учетную запись'),
         Padding(
           padding: EdgeInsets.all(8.0),
           child: Container(
             child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.login),
                hintText: 'введите логин'
              ),
             ),
           ),
         ),
         Padding(
           padding: EdgeInsets.all(8.0),
           child: Container(
             child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.login),
                hintText: 'введите пароль'
              ),
             ),
           ),
         )
        ],
      )),
    );
  }
}

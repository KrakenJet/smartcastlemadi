import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Lesson3.dart';
import 'package:flutter_application_1/LoginFirebaseProject.dart';
import 'package:flutter_application_1/api.dart';
import 'package:flutter_application_1/api2.dart';
import 'package:flutter_application_1/api_list.dart';
import 'package:flutter_application_1/catalog.dart';
import 'package:flutter_application_1/category_screen.dart';
import 'package:flutter_application_1/country_screen.dart';
import 'package:flutter_application_1/drawerBar.dart';
import 'package:flutter_application_1/film_details.dart';
import 'package:flutter_application_1/iphone9.dart';
import 'package:flutter_application_1/lesson4.dart';
import 'package:flutter_application_1/lesson5.dart';
import 'package:flutter_application_1/lesson6.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/loginFireBase.dart';
import 'package:flutter_application_1/news.dart';
import 'package:flutter_application_1/oplata.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/profilehomework.dart';
import 'package:flutter_application_1/recept_screen.dart';
import 'package:flutter_application_1/registration.dart';
import 'package:flutter_application_1/registrationFireBase.dart';
import 'package:flutter_application_1/ricky_page.dart';
import 'package:flutter_application_1/socialNetwork.dart';
import 'package:flutter_application_1/todo.dart';
import 'package:flutter_application_1/users.dart';
import 'package:flutter_application_1/usersTest.dart';
import 'package:flutter_application_1/verstka.dart';
import 'package:flutter_application_1/weather_api.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:crypto/crypto.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyDH8WLWW7LTPggVy4UbIijOIkjEow048s4',
        appId: 'com.example.flutter_application_1',
        messagingSenderId: 'sendid',
        projectId: 'smcastleprojectmadmadi',
        storageBucket: 'smcastleprojectmadmadi.appspot.com'),
  );

  runApp(const MainApp());
  initializeDateFormatting('ru', null).then((_) {});
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginFireBaseProject());
  }
}

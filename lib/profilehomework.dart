import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/registration.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profilehomework extends StatefulWidget {
  // String name;
  // String surname;
  // String number;
  // String email;
  // String city;
  // String birthdate;
  // String otchestvo;
  // String login;

  // profilehomework({
  //   super.key,
  //   required this.name,
  //   required this.surname,
  //   required this.number,
  //   required this.email,
  //   required this.city,
  //   required this.birthdate,
  //   required this.login,
  //   required this.otchestvo,
  // });

  @override
  State<profilehomework> createState() => _profilehomeworkState();
}

class _profilehomeworkState extends State<profilehomework> {
  String imageurl1 =
      'https://i.cbc.ca/1.2932482.1422309341!/fileImage/httpImage/ryan-gosling-internet-meme.jpg';
  @override
  void initState() {
    getLoginFromShared();

    super.initState();
  }

  String name = ' ';
  String surname = ' ';
  String phone = ' ';
  String email = ' ';
  String city = ' ';
  String birthday = ' ';
  Future getLoginFromShared() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    setState(() {
      name = share.getString('key_login')!;
      surname = share.getString('key_surname')!;
      phone = share.getString('key_phone')!;
      email = share.getString('key_email')!;
      city = share.getString('key_city')!;
      birthday = share.getString('key_date')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Рофиль', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 71, 172, 255),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 0, 101, 184),
          child: Column(children: [
            SizedBox(height: 20),
            Center(
              child: ClipOval(
                child: Image.network(imageurl1,
                    width: 200, height: 200, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      width: 170,
                      constraints: BoxConstraints(maxWidth: 170),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 76, 76, 76),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Имя',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey)),
                            Text(name,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ],
                        ),
                      )),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                            width: 150,
                            constraints: BoxConstraints(maxWidth: 150),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 76, 76, 76),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Фамилия',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey)),
                                  Text(surname,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ],
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 1 - 8 - 8,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 76, 76, 76),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.phone, size: 30, color: Colors.grey),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Телефон',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey)),
                                    Text(phone,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 1 - 8 - 8,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 76, 76, 76),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.email, size: 30, color: Colors.grey),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Email',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey)),
                                    Text(email,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 1 - 8 - 8,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 76, 76, 76),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.place, size: 30, color: Colors.grey),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Город',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey)),
                                    Text(city,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 1 - 8 - 8,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 76, 76, 76),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.date_range_outlined,
                                size: 30, color: Colors.grey),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Дата рождения',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey)),
                                    Text(birthday,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: 100),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registration()));
                          },
                          child: Text('Выйти', style: TextStyle())),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

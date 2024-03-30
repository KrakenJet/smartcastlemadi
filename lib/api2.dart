import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/info2.dart';
import 'package:http/http.dart' as http;
import 'info.dart';


class api2 extends StatefulWidget {
  const api2({super.key});

  @override
  State<api2> createState() => _api2State();
}

class _api2State extends State<api2> {

int idFromServer = 0;
String nameFromServer = '';
String usernameFromServer = '';
String emailFromServer = '';
String addressFromServer = '';
String phoneFromServer = '';
String websiteFromServer = '';
String companyFromServer = '';


  @override
  void initState() {
    getInfoFromServer2();
    super.initState();
  }
  Future getInfoFromServer2() async{
    final response2 = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

    print(response2.statusCode);

    if(response2.statusCode == 200){
      info2 info = info2.fromJson(jsonDecode(response2.body));

      setState(() {
        idFromServer = info.id!;
        nameFromServer = info.name!;
        usernameFromServer = info.username!;
        addressFromServer = info.address!.street!;
        emailFromServer = info.email!;




      });
    } else {
      throw 'Ошибка запроса';
    }
  }
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API2'), centerTitle: true, backgroundColor: Colors.grey,),
      body: Column(
        children: [
          Text(idFromServer.toString()),
          Text(nameFromServer.toString()),
          Text(usernameFromServer.toString()),
          Text(addressFromServer.toString()),
          Text(emailFromServer.toString()),
        ],
      ),
    );
  }
}
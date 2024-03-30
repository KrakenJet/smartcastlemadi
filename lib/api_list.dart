import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/info2.dart';
import 'package:http/http.dart' as http;

class api_list extends StatefulWidget {
  api_list({super.key});

  @override
  State<api_list> createState() => _api_listState();
}

class _api_listState extends State<api_list> {
  Future getUsers() async {
    setState(() {
      usersLoading = true;
    });

    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<info2> usersFromApi = List.from(jsonDecode(response.body))
          .map((map) => Map<String, dynamic>.from(map))
          .map((Map<String, dynamic> map) => info2.fromJson(map))
          .toList();

      setState(() {
        users = usersFromApi;

        usersLoading = false;
      });
    } else {
      throw 'Лох';
    }
  }

  List<info2> users = [];
  bool usersLoading = false;

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ЛИСТ АПИ'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: 
      
      usersLoading == true ?
      Center(child: Platform.isIOS 
      ? CupertinoActivityIndicator() 
      : CircularProgressIndicator()):
      
      ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, Index) {
            return Padding(
                padding: EdgeInsets.all(10.0), child: Text(users[Index].name!));
          }),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'info.dart';

class api extends StatefulWidget {
  const api({super.key});

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  String titleFromServer = '';
  String idFromServer = '';
  String userIdFromServer = '';
  bool completedFromServer = true;

  @override
  void initState() {
    super.initState();
    getInfoFromServer();
  }

  Future getInfoFromServer() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    print(response.statusCode);

    if (response.statusCode == 200) {
      info Info = info.fromJson(jsonDecode(response.body));

      setState(() {
        titleFromServer = Info.title!;
        idFromServer = Info.id.toString();
        userIdFromServer = Info.userId.toString();
        completedFromServer = Info.completed!;
      });
    } else {
      throw 'Ошибка запроса';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('API'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          children: [
            Text(titleFromServer, style: TextStyle(fontSize: 24)),
            Text(idFromServer, style: TextStyle(fontSize: 24)),
            Text(userIdFromServer, style: TextStyle(fontSize: 24)),
            Text(completedFromServer.toString(),
                style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

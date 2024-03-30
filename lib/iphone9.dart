import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/iphone9api.dart';
import 'package:flutter_application_1/product.dart';
import 'package:http/http.dart' as http;

class iphone9 extends StatefulWidget {
  iphone9({super.key});

  @override
  State<iphone9> createState() => _iphone9State();
}

class _iphone9State extends State<iphone9> {
  String? title;
  dynamic price;
  List<String>? images;
  String? description;
  bool userLoading = false;

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  Future getProduct() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/1'));
    setState(() {
      userLoading = true;
    });

    if (response.statusCode == 200) {
      producti phone = producti.fromJson(jsonDecode(response.body));

      setState(() {
        userLoading = false;
      });

      print(phone.title);
      setState(() {
        title = phone.title;
        price = phone.price;
        description = phone.description;
        images = phone.images;
      });
    } else {
      throw ('Лох');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iphone 9 lol'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: userLoading == true
          ? Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator())
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: [
                  Image.network(images!.first),
                  Text(title!, style: TextStyle(fontSize: 40)),
                  Text('${price.toString()} тенге',
                      style: TextStyle(fontSize: 40)),
                  Text(description!, style: TextStyle(fontSize: 40)),
                ],
              ),
          ),
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/product.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class catalog extends StatefulWidget {
  catalog({super.key});

  @override
  State<catalog> createState() => _catalogState();
}

class _catalogState extends State<catalog> {
  List<Products>? products = [];
  String? title;
  dynamic price;
  List<String>? images;
  bool userLoading = false;

  @override
  void initState() {
    getCatalogs();
    super.initState();
  }

  Future getCatalogs() async {
    setState(() {
          userLoading = true;
        });

    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
        

    if (response.statusCode == 200) {
      product goods = product.fromJson(jsonDecode(response.body));

      setState(() {
        products = goods.products;

        userLoading = false;
      });
    } else {
      throw 'страница ничего не говорит ваще';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Каталог'),
          centerTitle: true,
        ),
        body: 
        
      userLoading == true ?
      Center(child: Platform.isIOS 
      ? CupertinoActivityIndicator() 
      : CircularProgressIndicator()):
        
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: products!.length,
            itemBuilder: (context, index) {
              return Container(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            (products![index].images!.first),
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                        Text((products![index].title!),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('${products![index].price.toString()}T',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}

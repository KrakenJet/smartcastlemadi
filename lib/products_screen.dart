import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_screen.dart';
import 'package:flutter_application_1/country_model.dart';
import 'package:flutter_application_1/product.dart';
import 'package:flutter_application_1/ricky_info.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/ricky_model.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;

class productsScreen extends StatefulWidget {
  String categoryName;

  productsScreen({super.key, required this.categoryName});

  @override
  State<productsScreen> createState() => _productsScreenState();
}

class _productsScreenState extends State<productsScreen> {
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  List<Products>? products = [];
  String? title;
  dynamic price;
  List<String>? images;
  bool userLoading = false;
  List<Products> selectedProducts = [];

  Future getProducts() async {
    setState(() {
      userLoading = true;
    });
    final response = await http.get(Uri.parse(
        'https://dummyjson.com/products/category/${widget.categoryName}'));

    if (response.statusCode == 200) {
      product goods = product.fromJson(jsonDecode(response.body));

      setState(() {
        products = goods.products;
        userLoading = false;
      });
    }
  }

  void addToCart(Products product) {
    setState(() {
      selectedProducts.add(product);
    });
  }

  void removeFromCart(Products product) {
    setState(() {
      selectedProducts.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text(widget.categoryName,
              style: TextStyle(fontSize: 20, color: Colors.white))),
      body: userLoading == true
          ? Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator()) //LOADING/ЗАГРУЗКА
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemCount: products!.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 6, color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              (products![index].images!.first),
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Text((products![index].title!),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text('${products![index].price.toString()}₸',
                            style:
                                TextStyle(fontSize: 16, color: Colors.orange)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  addToCart(products![index]);
                                },
                                child: Text(
                                  'Добавить в корзину',
                                  style: TextStyle(color: Colors.orange),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white))),
                            IconButton(
                                onPressed: () {
                                  removeFromCart(products![index]);
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ),
                      ]),
                    ),
                  ),
                );
              }),
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            onPressed: () {
              if (selectedProducts.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.white,
                    content: Center(
                      child: Text(
                        'Корзина пуста',
                        style: TextStyle(fontSize: 20, color: Colors.orange),
                      ),
                    )));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            cartScreen(selectedProducts: selectedProducts)));
              }
            },
            child: Icon(Icons.shopping_cart),
            backgroundColor: Colors.orange,
          ),
          if (selectedProducts.isNotEmpty)
            Positioned(
                right: 0,
                child: badges.Badge(
                    badgeContent: Text(
                  '${selectedProducts.length}',
                  style: TextStyle(color: Colors.white),
                )))
        ],
      ),
    );
    return scaffold;
  }
}

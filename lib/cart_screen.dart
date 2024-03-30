import 'package:flutter/material.dart';
import 'package:flutter_application_1/product.dart';
import 'package:flutter_application_1/products_screen.dart';

class cartScreen extends StatefulWidget {
  List<Products> selectedProducts = [];

  cartScreen({super.key, required this.selectedProducts});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Корзина', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemCount: widget.selectedProducts.length,
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
                          (widget.selectedProducts[index].images!.first),
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Text((widget.selectedProducts[index].title!),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text('${widget.selectedProducts[index].price.toString()}₸',
                        style: TextStyle(fontSize: 16, color: Colors.orange)),
                  ]),
                ),
              ),
            );
          }),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_application_1/lesson4.dart';
import 'package:flutter_application_1/oplata.dart';

class Lesson5 extends StatelessWidget {
   Lesson5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        centerTitle: true, title: Text('Продукты', style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Oplata()));

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0), 
              child: Row(
                children: [
                  Image.network('https://www.karavay.spb.ru/upload/iblock/51f/stolichnyy1.png', height: 150, width: 150),
                  Column(
                    children: [
                      Text('хлеб',
                      style: TextStyle(fontSize: 20)),
                      Text('200 тг'),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.network('https://winery.ph/cdn/shop/products/abrilsol_refined_sunflower_oil_5000ml.png?v=1634017192', height: 150, width: 150,),
                Column(
                  children: [
                    Text('Масло',
                    style: TextStyle(fontSize: 20)),
                    Text('500 тг'), 
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.network('https://www.motts.com/images/products/motts-100-original-apple-juice.png', width: 150, height: 150),
                Column(
                  children: [
                    Text('Сок',
                    style: TextStyle(fontSize: 20)),
                    Text('600 тг'), 
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 200,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Oplata()));
              }, 
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, 
              shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16))),
        child: Text('оплатить', 
        style: TextStyle(fontSize: 20, color: Colors.white))
            ))
        ]
      ),
    );
  
  }
}
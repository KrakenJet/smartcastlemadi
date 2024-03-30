

import 'package:flutter/material.dart';
import 'package:flutter_application_1/lesson5.dart';

class Oplata extends StatelessWidget {
  const Oplata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Text('Поздравляю!', style: TextStyle(color: Colors.black, fontSize: 16)),
            Text('Оплата успешно пройдена!', style: TextStyle(color: Colors.black, fontSize: 16)),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 
                child: Text('назад', 
                style: TextStyle(
                  color: Colors.black)
                  )
                  )
                  )

            ]),
      )
    );
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHA Hash Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String input = "Hello, world!";
  String sha1Hash = '';
  String sha256Hash = '';

  void generateHashes() {
    var bytes = utf8.encode(input);
    var sha1Digest = sha1.convert(bytes);
    var sha256Digest = sha256.convert(bytes);

    setState(() {
      sha1Hash = sha1Digest.toString();
      sha256Hash = sha256Digest.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHA Hash Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Input: $input',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateHashes,
              child: Text('Generate Hashes'),
            ),
            SizedBox(height: 20),
            Text(
              'SHA1: $sha1Hash',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'SHA256: $sha256Hash',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

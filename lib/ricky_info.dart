import 'package:flutter/material.dart';
import 'package:flutter_application_1/ricky_model.dart';

class rickyInfo extends StatefulWidget {
  String name;
  String status;
  String? image;
  String location;
  String gender;
  String species;
  rickyInfo(
      {super.key,
      required this.name,
      required this.status,
      required this.image,
      required this.location,
      required this.gender,
      required this.species});

  @override
  State<rickyInfo> createState() => _rickyInfoState();
}

class _rickyInfoState extends State<rickyInfo> {
  
Color getStatusColor() {
    switch (widget.status.toLowerCase()) {
      case 'dead':
        return Colors.red;
      case 'alive':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,
            style: TextStyle(fontSize: 20, color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(widget.image!),
            Text(widget.name,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),

                Text('status: ${widget.status}', style: TextStyle(fontSize: 30, color: getStatusColor())),
                Text('location: ${widget.location}', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                Text('gender: ${widget.gender}', style: TextStyle(fontSize: 20)),
                Text('species: ${widget.species}', style: TextStyle(fontSize: 20)),
        
          ],
        ),
      ),
    );
  }
}

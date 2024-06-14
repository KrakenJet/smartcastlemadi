import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<DocumentSnapshot> users = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  PlatformFile? pickedFile;

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  Future getUsers() async {
    try {
      QuerySnapshot collection =
          await FirebaseFirestore.instance.collection('users').get();

      setState(() {
        users = collection.docs;
      });
    } catch (e) {
      print(e);
    }
  }

  Future createUser(String name, String age, String image) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc()
          .set({'name': name, 'age': int.parse(age), 'image': image});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Пользователи',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(users[index]['name'], style: TextStyle(fontSize: 50)),
                //Text(users[index]['id'].toString()),
                Text(users[index]['age'].toString(),
                    style: TextStyle(fontSize: 34)),
                //style: TextStyle(fontSize: 50)),
                Image.network(users[index]['image'], height: 250, width: 250)
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(hintText: 'Имя'),
                              controller: nameController,
                            ),
                            TextField(
                              decoration: InputDecoration(hintText: 'Возраст'),
                              controller: ageController,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () async {
                                  final result =
                                      await FilePicker.platform.pickFiles();
                                  if (result != null) {
                                    pickedFile = result.files.first;
                                  }
                                },
                                child: Container(
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Icon(Icons.add),
                                      Text('Выбрать фото'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            
                            ElevatedButton(
                                onPressed: () async {
                                  final path = 'files/${pickedFile!.name}';
                                  final file = File(pickedFile!.path!);
                                  final ref = FirebaseStorage.instance
                                      .ref()
                                      .child(path);
                                  ref.putFile(file);

                                  final String imageUrl =
                                      await ref.getDownloadURL();

                                  createUser(nameController.text,
                                      ageController.text, imageUrl);
                                  getUsers();
                                  Navigator.pop(context);
                                },
                                child: Text('Добавить'))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          child: Icon(Icons.add)),
    );
  }
}

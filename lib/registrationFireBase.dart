import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ProfileFirebase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationFirebase extends StatefulWidget {
  const RegistrationFirebase({Key? key}) : super(key: key);

  @override
  _RegistrationFirebaseState createState() => _RegistrationFirebaseState();
}

class _RegistrationFirebaseState extends State<RegistrationFirebase> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String? _selectedGender;
  File? _image;
  final List<String> genders = ['Мужской', 'Женский'];
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 200, 113),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/registration_screen.jpg'),
                    fit: BoxFit.cover)),
          ),
          Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Введите email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    labelText: 'Пароль',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Введите пароль';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    labelText: 'Подтвердите пароль',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Подтвердите пароль';
                    }
                    if (value != passwordController.text) {
                      return 'Пароли не совпадают';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    labelText: 'Имя пользователя',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Введите имя пользователя';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    labelText: 'Возраст',
                    prefixIcon: Icon(Icons.no_adult_content),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Введите возраст';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    labelText: 'Пол',
                    prefixIcon: Icon(Icons.accessibility_new),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  value: _selectedGender,
                  items: genders.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Выберите пол';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                _image == null
                    ? ElevatedButton(
                        onPressed: _pickImage,
                        child: Text(
                            _image == null ? 'Выбрать фото' : 'Изменить фото'),
                      )
                    : Column(
                        children: [
                          SizedBox(height: 20.0),
                          CircleAvatar(
                            radius: 150,
                            backgroundImage: FileImage(_image!),
                          ),
                        ],
                      ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });

                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        String imageUrl = '';
                        if (_image != null) {
                          String imageFileName =
                              DateTime.now().millisecondsSinceEpoch.toString();
                          Reference storageReference = FirebaseStorage.instance
                              .ref()
                              .child('user_images')
                              .child(imageFileName);
                          await storageReference.putFile(_image!);
                          imageUrl = await storageReference.getDownloadURL();
                        }
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(userCredential.user!.uid)
                            .set({
                          'email': emailController.text,
                          'username': usernameController.text,
                          'age': int.parse(ageController.text),
                          'gender': _selectedGender,
                          'imageUrl': imageUrl, // URL изображения
                        });
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileFireBase()));
                      } catch (e) {
                        setState(() {
                          isLoading = false;
                        });
                        print('Не удалось зарегистрироваться: $e');
                      }
                    }
                  },
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text('Зарегистрироваться'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}

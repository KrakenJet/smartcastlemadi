import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ProfileFirebase.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/profilehomework.dart';
import 'package:flutter_application_1/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginFireBase extends StatefulWidget {
  LoginFireBase({super.key});

  @override
  State<LoginFireBase> createState() => _LoginFireBaseState();
}

class _LoginFireBaseState extends State<LoginFireBase> {
  String errorText = '';
  bool loading = false;

  Future signin() async {
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginController.text, password: passwordController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileFireBase()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        errorText = 'Неверные данные';
      } else if (e.code == 'invalid-email') {
        errorText = 'Неверный формат';
      } else {
        errorText = 'Ошибка входа';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 4),
        content: Text(e.code),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60))),
      ));
    }
    setState(() {
      loading = false;
    });
  }

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Логин', style: TextStyle(color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 0, 200, 113),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: loginController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(
                        onPressed: () {
                          loginController.clear();
                        },
                        icon: Icon(Icons.close)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Логин',
                    hintText: 'Введите логин'),
                validator: (value) {
                  if (value == '') {
                    return 'Введите логин!';
                  }
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                obscureText: hidePassword,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (hidePassword == true) {
                            setState(() {
                              hidePassword = false;
                            });
                            hidePassword = false;
                          } else {
                            setState(() {
                              hidePassword = true;
                            });
                          }
                        },
                        icon: hidePassword == true
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                    labelText: 'Пароль',
                    hintText: 'Введите пароль'),
                validator: (kek) {
                  if (kek == '') {
                    return 'Введите пароль!';
                  }
                },
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => registration()));
                },
                child: Text(
                    'Если у вас нет аккаунта, то можете зарегистрироваться',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue)),
              ),
              SizedBox(height: 20),
              loading == true
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          signin();
                        }
                      },
                      child: Text('Войти', style: TextStyle())),
            ],
          ),
        ));
  }
}

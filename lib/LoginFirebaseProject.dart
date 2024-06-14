import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ProfileFirebase.dart';
import 'package:flutter_application_1/main_screen.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/profilehomework.dart';
import 'package:flutter_application_1/registration.dart';
import 'package:flutter_application_1/registrationFireBase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFireBaseProject extends StatefulWidget {
  LoginFireBaseProject({super.key});

  @override
  State<LoginFireBaseProject> createState() => _LoginFireBaseState();
}

class _LoginFireBaseState extends State<LoginFireBaseProject> {
  String errorText = '';
  bool loading = false;

  void initState() {
    super.initState();
    _tryAutoFill(); // Вызываем метод для автозаполнения
  }

  void _tryAutoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedLogin = prefs.getString('login');
    final savedPassword = prefs.getString('password');
    if (savedLogin != null && savedPassword != null) {
      setState(() {
        loginController.text = savedLogin;
        passwordController.text = savedPassword;
      });
    }
  }

  Future signin() async {
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginController.text, password: passwordController.text);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('login', loginController.text);
      await prefs.setString('password', passwordController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
      ;
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

  void _tryAutoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedLogin = prefs.getString('login');
    final savedPassword = prefs.getString('password');
    if (savedLogin != null && savedPassword != null) {
      setState(() {
        loginController.text = savedLogin;
        passwordController.text = savedPassword;
      });
    }
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
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/LoginScreen.jpg'),
                      fit: BoxFit.cover)),
            ),
            ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/LoginScreen.jpg'),
                          fit: BoxFit.cover)),
                ),
                Text(
                  'Доро пожаловать',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  controller: loginController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
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
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationFirebase()));
                  },
                  child: Container(
                    color: Colors.white.withOpacity(0.5),
                    child: Text('У меня нет учётной записи',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.green)),
                  ),
                ),
                SizedBox(height: 20),
                loading == true
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 0, 200, 113))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            signin();
                          }
                        },
                        child: Text('Войти', style: TextStyle())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

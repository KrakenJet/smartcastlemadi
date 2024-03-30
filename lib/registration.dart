import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/profilehomework.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class registration extends StatefulWidget {
  registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _key = GlobalKey<FormState>();

  List<String> cities = ['Шымкент', 'Алматы', 'Актау', 'Астана'];
  String selectedCity = 'Шымкент';
  String text = 'Выберите дату';

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Регистрация', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Имя',
                        hintText: 'Введите ваше имя'),
                    validator: (key) {
                      if (key == '') {
                        return 'Введите ваше имя!';
                      }
                    }),
                SizedBox(height: 20),
                TextFormField(
                    controller: surnameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Фамилия',
                        hintText: 'Введите вашу фамилию'),
                    validator: (key) {
                      if (key == '') {
                        return 'Введите фамилию!';
                      }
                    }),
                SizedBox(height: 20),
                TextFormField(
                    controller: secondNameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Отчество',
                        hintText: 'Введите ваше отчество'),
                    validator: (key) {
                      if (key == '') {
                        return 'Введите Отчество!';
                      }
                    }),
                SizedBox(height: 20),
                TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Email',
                        hintText: 'Введите ваш email'),
                    validator: (key) {
                      if (key == '') {
                        return 'Введите email!';
                      }
                    }),
                SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2030));

                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Container(
                    height: 40,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                          selectedDate == null
                              ? 'выберите дату рождения'
                              : DateFormat.yMMMMd('ru').format(selectedDate!),
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                    controller: phoneController,
                    inputFormatters: [
                      MaskTextInputFormatter(
                          mask: '+# (###) ###-##-##',
                          filter: {
                            "#": RegExp(r'[0-9]'),
                          })
                    ],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Номер телефона',
                        hintText: 'Введите номер телефона'),
                    validator: (key) {
                      if (key == '') {
                        return 'Введите номер телефона!';
                      }
                    }),
                SizedBox(height: 20),
                DropdownButtonFormField(
                    items: cities
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    value: selectedCity,
                    onChanged: (NewCity) {
                      selectedCity = NewCity!;
                    }),
                SizedBox(height: 20),
                TextFormField(
                    controller: loginController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Логин',
                        hintText: 'Введите ваш логин'),
                    validator: (key) {
                      if (key == '') {
                        return 'Введите логин!';
                      }
                    }),
                SizedBox(height: 20),
                TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Пароль',
                        hintText: 'Введите ваш пароль'),
                    validator: (key) {
                      if (key == '') {
                        return 'Введите пароль!';
                      }
                    }),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                     {
                      SharedPreferences share =
                          await SharedPreferences.getInstance();
                      share.setString('key_name', nameController.text);
                      share.setString('key_surname', surnameController.text);
                      share.setString('key_secondName', secondNameController.text);
                      share.setString('key_city', selectedCity);
                      share.setString('key_phone', phoneController.text);
                      share.setString('key_email', emailController.text);
                      share.setString('key_date', selectedDate != null ? DateFormat.yMMMMd('ru').format(selectedDate!) : 'Дата не выбрана');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => profilehomework(
                                  // login: loginController.text,
                                  // name: nameController.text,
                                  // surname: surnameController.text,
                                  // otchestvo: secondNameController.text,
                                  // city: selectedCity,
                                  // number: phoneController.text,
                                  // email: emailController.text,
                                  // birthdate: selectedDate != null ? DateFormat.yMMMMd('ru').format(selectedDate!) : 'Дата не выбрана'
                                  )));
                    }
                  },
                  child: Text('Авторизация'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

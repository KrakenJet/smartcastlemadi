import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileFirebase extends StatefulWidget {
  final String? username;
  final int? age;
  final String? gender;
  final String? imageUrl;
  final String? bio;
  final String? phoneNumber;
  final String? location;
  final VoidCallback onUpdateProfile;

  const EditProfileFirebase({
    Key? key,
    this.username,
    this.age,
    this.gender,
    this.imageUrl,
    this.bio,
    this.phoneNumber,
    this.location,
    required this.onUpdateProfile,
  }) : super(key: key);

  @override
  _EditProfileFirebaseState createState() => _EditProfileFirebaseState();
}

class _EditProfileFirebaseState extends State<EditProfileFirebase> {
  late TextEditingController _usernameController;
  late TextEditingController _ageController;
  late TextEditingController _bioController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _locationController;
  String? _selectedGender;
  File? _image;
  final List<String> _locations = ['США', 'РОссия', 'Германия', 'Казахстан', 'Китай'];

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.username ?? '');
    _ageController = TextEditingController(text: widget.age != null ? widget.age.toString() : '');
    _bioController = TextEditingController(text: widget.bio ?? '');
    _phoneNumberController = TextEditingController(text: widget.phoneNumber ?? '');
    _locationController = TextEditingController(text: widget.location ?? '');
    _selectedGender = widget.gender;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _ageController.dispose();
    _bioController.dispose();
    _phoneNumberController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      String imageUrl = widget.imageUrl ?? ''; 
      if (_image != null) {
       
        String imageName = 'profile_image_${currentUser?.uid ?? ''}';
        Reference ref = FirebaseStorage.instance.ref().child('profile_images').child(imageName);

        TaskSnapshot uploadTask = await ref.putFile(_image!);
        imageUrl = await uploadTask.ref.getDownloadURL();
      }

      final userData = {
        'username': _usernameController.text,
        'age': int.parse(_ageController.text),
        'gender': _selectedGender,
        'imageUrl': imageUrl,
        'bio': _bioController.text,
        'phoneNumber': _phoneNumberController.text,
        'location': _locationController.text,
      };
      await FirebaseFirestore.instance.collection('users').doc(currentUser?.uid).update(userData);

      widget.onUpdateProfile();

      Navigator.pop(context);
    } catch (e) {
      print('Ошибка: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка сохранения изменений: $e'),
        ),
      );
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Изменить профиль', style: TextStyle(color: Colors.white),), centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 200, 113),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoCircle(
                label: 'Имя пользователя',
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20.0),
              _buildInfoCircle(
                label: 'Возраст',
                child: TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(border: InputBorder.none),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20.0),
              _buildInfoCircle(
                label: 'Пол',
                child: DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: ['Мужской', 'Женский'].map((String gender) {
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
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20.0),
              _buildInfoCircle(
                label: 'Биография',
                child: TextFormField(
                  controller: _bioController,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20.0),
              _buildInfoCircle(
                label: 'Телефонный номер',
                child: TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(border: InputBorder.none),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              _buildInfoCircle(
                label: 'Местоположение',
                child: DropdownButtonFormField<String>(
                  value: _locations.contains(_locationController.text) ? _locationController.text : null,
                  items: _locations.map((String location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _locationController.text = value ?? '';
                    });
                  },
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20.0),
              _image == null
                ? ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Выбрать фото'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 200, 113),
                    ),
                  )
                : Column(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: FileImage(_image!),
                      ),
                      ElevatedButton(
                        onPressed: _pickImage,
                        child: Text('Изменить фото'),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 0, 200, 113),
                        ),
                      ),
                    ],
                  ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _saveChanges,
                child: Text('Сохранить'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 200, 113),
                ),
              ),
            ],
          ),
        ),
      ),
    );  
  }

  Widget _buildInfoCircle({required String label, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Color.fromARGB(255, 0, 200, 113), width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Chat_screen.dart';
import 'package:flutter_application_1/EditProfileFirebase.dart';
import 'package:flutter_application_1/FriendListScree.dart';
import 'package:flutter_application_1/friendlist.dart';
import 'package:flutter_application_1/newsFeedPage.dart';
import 'package:flutter_application_1/registrationFireBase.dart';

class ProfileFireBase extends StatefulWidget {
  const ProfileFireBase({Key? key}) : super(key: key);

  @override
  State<ProfileFireBase> createState() => _ProfileFireBaseState();
}

class _ProfileFireBaseState extends State<ProfileFireBase> {
  bool isLoading = true;
  late User currentUser;
  String? username;
  String? imageUrl;
  String? gender;
  int? age;
  String? bio;
  String? phoneNumber;
  String? location;

  void _updateProfile() {
    setState(() {
      fetchUserData();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUser = user;
      });
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (userDoc.exists) {
          Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
          setState(() {
            username = data['username'];
            imageUrl = data['imageUrl'];
            gender = data['gender'];
            age = data['age'];
            bio = data['bio'];
            phoneNumber = data['phoneNumber'];
            location = data['location'];
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User document does not exist.'),
            ),
          );
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error fetching user data: $e'),
          ),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No user is currently signed in.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Профиль',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 200, 113),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProfileFirebase(
                        username: username,
                        age: age,
                        gender: gender,
                        imageUrl: imageUrl,
                        bio: bio,
                        phoneNumber: phoneNumber,
                        location: location,
                        onUpdateProfile: _updateProfile)),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/profile_screen.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (imageUrl != null)
                            CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(imageUrl!),
                            ),
                          SizedBox(height: 20),
                          _buildInfoCircle('Имя пользователя',
                              username ?? 'Нет имени пользователя'),
                          _buildInfoCircle(
                              'Электронная почта',
                              currentUser.email ??
                                  'Нет адреса электронной почты'),
                          _buildInfoCircle('Пол', gender ?? 'Неизвестно'),
                          _buildInfoCircle(
                              'Возраст', age?.toString() ?? 'Неизвестно'),
                          _buildInfoCircle('Биография', bio ?? 'Нет биографии'),
                          _buildInfoCircle('Телефонный номер',
                              phoneNumber ?? 'Нет телефонного номера'),
                          _buildInfoCircle('Местоположение',
                              location ?? 'Нет местоположения'),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(),
                                ),
                              );
                            },
                            child: Text('Личное сообщение'),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 229, 34, 21))),
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Выйти',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildInfoCircle(String label, String value) {
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
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

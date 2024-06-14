import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FriendListScreen extends StatefulWidget {
  @override
  _FriendListScreenState createState() => _FriendListScreenState();
}

class _FriendListScreenState extends State<FriendListScreen> {
  late List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      List<Map<String, dynamic>> userList = [];
      querySnapshot.docs.forEach((doc) {
        userList.add(doc.data() as Map<String, dynamic>);
      });
      setState(() {
        users = userList;
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список пользователей', style: TextStyle(color: Colors.white),), centerTitle: true, backgroundColor: Colors.green,
      ),
      body: Container(
        color: Color.fromARGB(255, 0, 200, 113),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Card(
              color: Colors.white,
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user['imageUrl'] ?? ''),
                ),
                title: Text(
                  user['username'] ?? 'Безымянный пользователь',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                subtitle: Text(
                  user['email'] ?? 'Без адреса электронной почты',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // ДОБАВКА ДРУГА В СПИСОК ПОТОМ СДЕЛАЮ
                    addToFriends(user);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void addToFriends(Map<String, dynamic> user) {
    // ДОБАВКА ДРУГА
  }
}

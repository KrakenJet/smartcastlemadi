import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/post.dart';

class NewsFeedPage extends StatefulWidget {
  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  final TextEditingController _postController = TextEditingController();
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<void> _addPost() async {
    if (_postController.text.isEmpty) return;

    final post = Post(
      id: '',
      userId: currentUser!.uid,
      content: _postController.text,
      timestamp: DateTime.now(),
    );

    await FirebaseFirestore.instance.collection('posts').add(post.toMap());

    _postController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Лента новостей', style: TextStyle(color: Colors.white)), centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 200, 113),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _postController,
                    decoration: InputDecoration(
                      hintText: 'Что у вас нового?',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _addPost,
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('posts')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final posts = snapshot.data!.docs.map((doc) {
                  return Post.fromMap(doc.data() as Map<String, dynamic>, doc.id);
                }).toList();

                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              post.content,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              '${post.timestamp.day}.${post.timestamp.month}.${post.timestamp.year}',
                              style: TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:intl/intl.dart';

class Post {
  String id;
  String userId;
  String content;
  String? imageUrl;
  DateTime timestamp;

  Post({
    required this.id,
    required this.userId,
    required this.content,
    this.imageUrl,
    required this.timestamp,
  });

  String get formattedTimestamp => DateFormat.yMMMd().add_jm().format(timestamp);

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'content': content,
      'imageUrl': imageUrl,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  static Post fromMap(Map<String, dynamic> map, String id) {
    return Post(
      id: id,
      userId: map['userId'],
      content: map['content'],
      imageUrl: map['imageUrl'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}

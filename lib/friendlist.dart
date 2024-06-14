class AppUser {
  String id;
  String username;
  String email;
  String imageUrl;

  AppUser({
    required this.id,
    required this.username,
    required this.email,
    required this.imageUrl,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      imageUrl: map['imageUrl'],
    );
  }
}

class AppUser {
  String id;
  String username;
  String email;
  String avatarUrl;

  AppUser({
    required this.id,
    required this.username,
    required this.email,
    required this.avatarUrl,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      avatarUrl: map[
          'avatarUrl'], 
    );
  }
}

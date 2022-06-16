class Post {
  final int id;
  final int userId;
  final String title;

  Post({required this.id, required this.userId, required this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String
    );
  }
}
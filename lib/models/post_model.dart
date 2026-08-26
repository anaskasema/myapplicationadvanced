class PostModel {
  final String title;
  final String body;
  final int userId;
  PostModel({required this.title, required this.body, required this.userId});
  Map<String, dynamic> toJson() => {"title": title, "body": body, "userId": userId};
}

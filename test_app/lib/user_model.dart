import 'dart:convert';

class UserModel {
  int userId;
  int? that;
  String title;
  String body;

  UserModel({
    required this.userId,
    required this.that,
    required this.title,
    required this.body,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) => UserModel(
        userId: jsonData['userId'],
        that: jsonData['that'],
        title: jsonData['title'],
        body: jsonData['body'],
      );
}

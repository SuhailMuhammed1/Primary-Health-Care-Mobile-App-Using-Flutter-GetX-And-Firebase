
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String username;
  final String email;
  final String password;

  const UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  toJson() {
    return {
      "Name": username,
      "Email": email,
      "Password": password,
    };
  }

  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data['Email'],
      username: data['Name'],
      password: data['Password'],
    );
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
  });
  final String? id;
  final String name;
  final String email;
  final String phoneNo;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      'name': name,
      'email': email,
      'phoneNo': phoneNo,
    };
  }

  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document) {
    final map = document.data()!;
    return UserModel(
      id: map["id"] != null ? map["id"] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNo: map['phoneNo'] as String,
    );
  }
}

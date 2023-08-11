// ignore_for_file: body_might_complete_normally_catch_error

import 'dart:developer';
import 'package:bir_urma_clone/src/modules/profile/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileService {
  final db = FirebaseFirestore.instance;

  Future<void> createUsertoDb(UserModel user) async {
    await db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => const SnackBar(
            content: Text('Success'),
          ),
        )
        .catchError((error, stackTrace) {
      const SnackBar(
        content: Text('Error'),
      );
      log(error.toString());
    });
  }

  Future<UserModel> getUserDetails() async {
    final snapshot = await db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromJson(e)).single;
    return userData;
  }

  Future<List<UserModel>> getAllUsers() async {
    final snapshot = await db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromJson(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    return await db.collection("Users").doc(user.id).update(user.toJson());
  }

  changePassword() async {}
}

final profileService = ProfileService();

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_managment_system/Model/user_model.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchUsers() async {
    isLoading.value = true;

    try {
      QuerySnapshot snapshot = await _firestore.collection('users').get();

      users.value = snapshot.docs
          .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint("Error fetching users: $e");
    } finally {
      isLoading.value = false;
    }
  }
}

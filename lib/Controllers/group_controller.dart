import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_managment_system/Model/group_model.dart';

class GroupController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var groups = <Group>[].obs; // Reactive list to store all groups
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchAllGroups();
  }

  // Function to fetch all groups from Firestore
  Future<void> fetchAllGroups() async {
    isLoading.value = true;

    try {
      // Get all documents from the 'groups' collection
      QuerySnapshot snapshot = await _firestore.collection('groups').get();

      // Map snapshot data to Group model and add them to the reactive list
      groups.value = snapshot.docs
          .map((doc) => Group.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching groups: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final users = <Map<String, dynamic>>[];

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      for (var doc in querySnapshot.docs) {
        users.add({'id': doc.id, ...doc.data()});
      }
    } catch (e) {
      print("Error fetching users: $e");
    }

    return users;
  }

  Future<void> shareGroupWithUser(String userId, Group group) async {
    try {
      final groupData = group.toJson();
      await FirebaseFirestore.instance
          .collection('usersgroups')
          .doc(group.uid)
          .set(groupData);
      await FirebaseFirestore.instance
          .collection('usersgroups')
          .doc(group.uid)
          .update({"createdBy": userId});

      Get.snackbar('Success', 'Group shared successfully.');
    } catch (e) {
      debugPrint("this is the error in the sharing data: $e");
      Get.snackbar('Error', 'Failed to share group: $e');
    }
  }
}

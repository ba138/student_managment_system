import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_managment_system/Model/group_model.dart';

class GroupController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var groups = <Group>[].obs; // Reactive list to store all groups

  // Function to fetch all groups from Firestore
  Future<void> fetchAllGroups() async {
    try {
      // Get all documents from the 'groups' collection
      QuerySnapshot snapshot = await _firestore.collection('groups').get();

      // Map snapshot data to Group model and add them to the reactive list
      groups.value = snapshot.docs
          .map((doc) => Group.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching groups: $e");
    }
  }
}

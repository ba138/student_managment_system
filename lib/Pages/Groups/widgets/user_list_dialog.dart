// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:student_managment_system/Controllers/group_controller.dart';

import '../../../Model/group_model.dart';

Future<void> showUserSelectionDialog(BuildContext context, Group group) async {
  GroupController groupController = Get.put(GroupController());
  final users = await groupController.fetchUsers();

  if (users.isEmpty) {
    Get.snackbar('No Users', 'No users found in the system.');
    return;
  }

  await showDialog(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(50.0),
        child: AlertDialog(
          title: const Text("Select User"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user['name'] ?? 'Unknown User'),
                  onTap: () async {
                    await groupController.shareGroupWithUser(user['id'], group);
                    Navigator.pop(context); // Close the dialog
                  },
                );
              },
            ),
          ),
        ),
      );
    },
  );
}

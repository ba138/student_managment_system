import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managment_system/Controllers/group_controller.dart';
import 'package:student_managment_system/Model/group_model.dart';
import 'package:student_managment_system/Utills/colors.dart';

class ShareDataDialog extends StatelessWidget {
  final Group group; // Group to share

  ShareDataDialog({super.key, required this.group});

  final GroupController _controller = Get.put(GroupController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: _controller.fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 150,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasError) {
            return SizedBox(
              height: 150,
              child: Center(child: Text('Error: ${snapshot.error}')),
            );
          }

          final users = snapshot.data ?? [];

          if (users.isEmpty) {
            return const SizedBox(
              height: 150,
              child: Center(child: Text('No users found.')),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Share Group with User',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: Text(
                            user['name']?.substring(0, 1).toUpperCase() ?? 'U',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(user['name'] ?? 'Unknown User'),
                        subtitle: Text(user['email'] ?? 'No email'),
                        onTap: () {
                          _controller.shareGroupWithUser(user['userId'], group);
                          Navigator.pop(context); // Close dialog
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

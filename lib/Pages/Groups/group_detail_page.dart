import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managment_system/Controllers/group_controller.dart';
import 'package:student_managment_system/Utills/colors.dart';
import 'package:student_managment_system/Utills/global_keys.dart';
import 'package:student_managment_system/Utills/header.dart';
import 'package:student_managment_system/Utills/responsive.dart';

import '../../Utills/side_menu.dart';
import 'share_data_dialog.dart';

class GroupDetailPage extends StatelessWidget {
  const GroupDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupController groupController = Get.put(GroupController());

    return Scaffold(
      key: getCourseScaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            // Header with a callback for the menu or other actions
            SizedBox(
              height: 64,
              child: Header(fct: () {}),
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Side menu for larger screens (Desktop)
                  if (Responsive.isDesktop(context))
                    const SizedBox(
                      width: 250,
                      child: SideMenu(),
                    ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: AppColors.secondryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Groups",
                                      style: GoogleFonts.getFont(
                                        "Poppins",
                                        textStyle: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 10),
                                    Divider(
                                      color: AppColors.primaryColor,
                                      thickness: 2,
                                    ),
                                    const SizedBox(height: 10),

                                    const Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Text(
                                              'S.No',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              'Group Title',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              'Participants',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              'Courses',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Text(
                                              'Status',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Text(
                                              'Status',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Divider(
                                      color: AppColors.primaryColor,
                                      thickness: 2,
                                    ),
                                    const SizedBox(height: 10),

                                    // Display groups
                                    Obx(() {
                                      if (groupController.isLoading.value) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }

                                      if (groupController.groups.isEmpty) {
                                        return const Center(
                                            child: Text("No groups found."));
                                      }

                                      return Column(
                                        children: List.generate(
                                          groupController.groups.length,
                                          (index) {
                                            final group =
                                                groupController.groups[index];
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                children: [
                                                  // S.No
                                                  Expanded(
                                                    flex: 1,
                                                    child: Center(
                                                        child: Text(
                                                            "${index + 1}")),
                                                  ),
                                                  // Group Title
                                                  Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                        child: Text(
                                                            group.groupTitle)),
                                                  ),
                                                  // Participants
                                                  Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                        child: Text(group
                                                            .participants.length
                                                            .toString())),
                                                  ),
                                                  // Courses
                                                  Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                      child: Text(
                                                        group.selectedCourses
                                                            .length
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ),
                                                  // Status
                                                  Expanded(
                                                    flex: 1,
                                                    child: Center(
                                                        child: Text(
                                                      group.status,
                                                      style: TextStyle(
                                                        color: group.status ==
                                                                "Active"
                                                            ? Colors.green
                                                            : Colors.red,
                                                      ),
                                                    )),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.dialog(
                                                          ShareDataDialog(
                                                            group: group,
                                                          ),
                                                          barrierDismissible:
                                                              false, // Prevent accidental dismissal
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            6,
                                                          ),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "Share",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }),

                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managment_system/Controllers/group_controller.dart';
import 'package:student_managment_system/Utills/colors.dart';
import 'package:student_managment_system/Utills/global_keys.dart';
import 'package:student_managment_system/Utills/header.dart';
import 'package:student_managment_system/Utills/responsive.dart';

import '../../Utills/side_menu.dart';

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
                                    // const SizedBox(height: 16),
                                    // Row(
                                    //   children: [
                                    //     // Search box for groups
                                    //     Container(
                                    //       height: 38,
                                    //       width: MediaQuery.of(context)
                                    //               .size
                                    //               .width /
                                    //           5,
                                    //       decoration: BoxDecoration(
                                    //         border: Border(
                                    //           left: BorderSide(
                                    //             color: AppColors.primaryColor,
                                    //             width: 1.0,
                                    //           ),
                                    //           top: BorderSide(
                                    //             color: AppColors.primaryColor,
                                    //             width: 1.0,
                                    //           ),
                                    //           bottom: BorderSide(
                                    //             color: AppColors.primaryColor,
                                    //             width: 1.0,
                                    //           ),
                                    //           right: BorderSide.none,
                                    //         ),
                                    //         borderRadius:
                                    //             const BorderRadius.only(
                                    //           topLeft: Radius.circular(8),
                                    //           bottomLeft: Radius.circular(8),
                                    //         ),
                                    //       ),
                                    //       child: const TextField(
                                    //         decoration: InputDecoration(
                                    //           isDense: true,
                                    //           contentPadding:
                                    //               EdgeInsets.symmetric(
                                    //                   vertical: 8.0),
                                    //           hintText: 'Search groups',
                                    //           hintStyle: TextStyle(
                                    //               color: Colors.black),
                                    //           border: InputBorder.none,
                                    //           prefixIcon: Icon(Icons.search,
                                    //               color: Colors.black),
                                    //         ),
                                    //         textAlignVertical:
                                    //             TextAlignVertical.center,
                                    //         style:
                                    //             TextStyle(color: Colors.black),
                                    //       ),
                                    //     ),
                                    //     InkWell(
                                    //       onTap: () {},
                                    //       child: Container(
                                    //         height: 38,
                                    //         width: MediaQuery.of(context)
                                    //                 .size
                                    //                 .width /
                                    //             13,
                                    //         decoration: BoxDecoration(
                                    //           color: AppColors.primaryColor,
                                    //           borderRadius:
                                    //               const BorderRadius.only(
                                    //             topRight: Radius.circular(8),
                                    //             bottomRight: Radius.circular(8),
                                    //           ),
                                    //         ),
                                    //         child: Center(
                                    //           child: Text(
                                    //             "Search",
                                    //             style: GoogleFonts.getFont(
                                    //               "Poppins",
                                    //               textStyle: TextStyle(
                                    //                 fontSize: 14,
                                    //                 fontWeight: FontWeight.w600,
                                    //                 color:
                                    //                     AppColors.secondryColor,
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     const SizedBox(width: 12),
                                    //   ],
                                    // ),
                                    const SizedBox(height: 10),
                                    const Divider(),
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
                                          flex: 3,
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
                                          flex: 2,
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
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Divider(),
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
                                                    flex: 3,
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
                                                    flex: 2,
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

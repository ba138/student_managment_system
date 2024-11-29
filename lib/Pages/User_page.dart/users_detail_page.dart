import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managment_system/Controllers/user_controller.dart';
import 'package:student_managment_system/Utills/colors.dart';
import 'package:student_managment_system/Utills/global_keys.dart';
import 'package:student_managment_system/Utills/header.dart';
import 'package:student_managment_system/Utills/responsive.dart';
import 'package:student_managment_system/Utills/side_menu.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the UserController
    final UserController userController = Get.put(UserController());

    return Scaffold(
      key: getCourseScaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 64,
              child: Header(fct: () {}),
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Responsive.isDesktop(context))
                    const SizedBox(
                      width: 250, // Set the width of the side menu
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
                                      "Users",
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
                                    //           hintText: 'Search here',
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

                                    // Headers for user data (with consistent flex values)
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
                                              'Name',
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
                                              'Email',
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
                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              'Verified',
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
                                    const Divider(),
                                    const SizedBox(height: 10),

                                    // Display users
                                    Obx(() {
                                      if (userController.isLoading.value) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }

                                      if (userController.users.isEmpty) {
                                        return const Center(
                                            child: Text("No users found."));
                                      }

                                      return Column(
                                        children: List.generate(
                                          userController.users.length,
                                          (index) {
                                            final user =
                                                userController.users[index];
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Center(
                                                        child: Text(
                                                            "${index + 1}")),
                                                  ), // S.No
                                                  Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                        child: Text(user.name)),
                                                  ), // Name
                                                  Expanded(
                                                    flex: 3,
                                                    child: Center(
                                                        child:
                                                            Text(user.email)),
                                                  ), // Email
                                                  Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                        child: Text(
                                                      "Verified",
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                      ),
                                                    )),
                                                  ), // Status
                                                  const Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      "Verified",
                                                      style: TextStyle(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                    ),
                                                  ), // Empty column for alignment
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

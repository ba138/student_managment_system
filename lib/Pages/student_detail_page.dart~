import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managment_system/Controllers/student_controller.dart';
import 'package:student_managment_system/Utills/colors.dart';
import 'package:student_managment_system/Utills/global_keys.dart';
import 'package:student_managment_system/Utills/header.dart';
import 'package:student_managment_system/Utills/responsive.dart';
import 'package:student_managment_system/Utills/side_menu.dart';

class StudentDetailPage extends StatelessWidget {
  const StudentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Get.put(StudentController());

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
                                      "Students",
                                      style: GoogleFonts.getFont(
                                        "Poppins",
                                        textStyle: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
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
                                          flex: 1,
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
                                          flex: 2,
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
                                              'Phone Number',
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
                                              'Address',
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

                                    // Use Obx to display data dynamically
                                    Obx(() {
                                      if (studentController.isLoading.value) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }

                                      if (studentController
                                          .studentList.isEmpty) {
                                        return const Center(
                                          child: Text("No students found"),
                                        );
                                      }

                                      // Map student data to rows
                                      return Column(
                                        children: List.generate(
                                          studentController.studentList.length,
                                          (index) {
                                            final student = studentController
                                                .studentList[index];
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Center(
                                                      child: Text((index + 1)
                                                          .toString()),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Center(
                                                      child: Text(
                                                          student.fullName),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                      child:
                                                          Text(student.email),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                      child: Text(
                                                          student.phoneNumber),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                      child:
                                                          Text(student.address),
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
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

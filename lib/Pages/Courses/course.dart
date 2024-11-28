import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managment_system/Model/course_model.dart';
import 'package:student_managment_system/Utills/add_course_dialog.dart';
import 'package:student_managment_system/Utills/colors.dart';
import 'package:student_managment_system/Controllers/course_controller.dart'; // Import the CourseController

import '../../Utills/global_keys.dart';
import '../../Utills/header.dart';
import '../../Utills/responsive.dart';
import '../../Utills/side_menu.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    final courseController =
        CourseController(); // Create instance of CourseController

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
                                      "Courses",
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
                                    Row(
                                      children: [
                                        Container(
                                          height: 38,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              left: BorderSide(
                                                color: AppColors.primaryColor,
                                                width: 1.0,
                                              ),
                                              top: BorderSide(
                                                color: AppColors.primaryColor,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: AppColors.primaryColor,
                                                width: 1.0,
                                              ),
                                              right: BorderSide.none,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                            ),
                                          ),
                                          child: const TextField(
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              hintText: 'Search here',
                                              hintStyle: TextStyle(
                                                  color: Colors.black),
                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.search,
                                                  color: Colors.black),
                                            ),
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 38,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                13,
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Search",
                                                style: GoogleFonts.getFont(
                                                  "Poppins",
                                                  textStyle: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColors.secondryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (c) =>
                                                    const AddCourseDialog(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 38,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                13,
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Add Course",
                                                style: GoogleFonts.getFont(
                                                  "Poppins",
                                                  textStyle: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColors.secondryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Divider(),
                                    const SizedBox(height: 10),

                                    // Added headers for course data
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
                                              'Course Title',
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
                                              'Total Modules',
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
                                              'Total Lesson',
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
                                              'Phone Number',
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

                                    // Use FutureBuilder to fetch and display courses data
                                    FutureBuilder<List<Courses>>(
                                      future: courseController
                                          .fetchCoursesWithDetails(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        if (snapshot.hasError) {
                                          return Center(
                                              child: Text(
                                                  'Error: ${snapshot.error}'));
                                        }
                                        if (!snapshot.hasData ||
                                            snapshot.data!.isEmpty) {
                                          return const Center(
                                              child: Text('No courses found'));
                                        }

                                        var courses = snapshot.data!;
                                        return Column(
                                          children: courses
                                              .asMap()
                                              .map((index, course) {
                                                return MapEntry(
                                                  index,
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical:
                                                            8.0), // Add vertical spacing
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
                                                              child: Text(course
                                                                  .courseTitle)),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Center(
                                                              child: Text(
                                                                  "${course.modules.length}")),
                                                        ), // Total Modules
                                                        Expanded(
                                                          flex: 2,
                                                          child: Center(
                                                              child: Text(
                                                                  "${course.modules.expand((module) => module.lessons).length}")),
                                                        ), // Total Lessons
                                                        Expanded(
                                                          flex: 1,
                                                          child: InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              height: 28,
                                                              width: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: AppColors
                                                                    .primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "View",
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    "Poppins",
                                                                    textStyle:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: AppColors
                                                                          .secondryColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              })
                                              .values
                                              .toList(),
                                        );
                                      },
                                    ),

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

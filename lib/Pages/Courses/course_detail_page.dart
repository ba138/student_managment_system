import 'package:flutter/material.dart';
import 'package:student_managment_system/Model/course_model.dart';
import '../../Utills/colors.dart';
import '../../Utills/header.dart';
import '../../Utills/side_menu.dart';

class CourseDetailPage extends StatelessWidget {
  final Courses course;

  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            SizedBox(
              height: 64,
              child: Header(fct: () {
                // Header action can be added here
              }),
            ),
            Expanded(
              child: Row(
                children: [
                  // Side Menu
                  const SizedBox(
                    width: 250,
                    child: SideMenu(),
                  ),
                  // Course Content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Course Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Course Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                course.imageUrl,
                                height: 300,
                                width: 250,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Course Title
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Course Title:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.redAccent),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  course.courseTitle,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),

                            // Course Summary
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Total Modules:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.redAccent),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "${course.modules.length}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Total Lessons:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.redAccent),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "${course.modules.expand((module) => module.lessons).length}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            //  Divider(
                            //   thickness: 2,
                            //   color: AppColors.primaryColor,
                            // ),

                            // Wrap Course Details in Card
                            Card(
                              elevation: 9,
                              margin: const EdgeInsets.only(top: 16),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(
                                      color: Colors.redAccent)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Modules and Lessons
                                    ...course.modules.map((module) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Module Title
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Module:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.redAccent),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                module.moduleName,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          // Module Lessons
                                          ...module.lessons.map((lesson) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        "Lesson:",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .redAccent),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      Text(
                                                        lesson.lessonName,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Description: ${lesson.lessonDescription}",
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  const Divider(
                                                    thickness: 1,
                                                    color: Colors.redAccent,
                                                  ),
                                                  const SizedBox(height: 4),
                                                ],
                                              ),
                                            );
                                          }),
                                          const Divider(), // Divider after each module
                                        ],
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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

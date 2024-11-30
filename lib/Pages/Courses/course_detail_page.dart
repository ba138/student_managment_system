import 'package:flutter/material.dart';
import 'package:student_managment_system/Model/course_model.dart';
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Course Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Course Image
                            Card(
                              elevation: 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  course.imageUrl,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Course Title
                            Text(
                              "Course Title: ${course.courseTitle}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Course Summary
                            Text("Total Modules: ${course.modules.length}"),
                            const SizedBox(height: 8),
                            Text(
                              "Total Lessons: ${course.modules.expand((module) => module.lessons).length}",
                            ),
                            const Divider(),

                            // Wrap Course Details in Card
                            Card(
                              elevation: 5,
                              margin: const EdgeInsets.only(top: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
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
                                          Text(
                                            "Module: ${module.moduleName}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
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
                                                  Text(
                                                    "Lesson: ${lesson.lessonName}",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Description: ${lesson.lessonDescription}",
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
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

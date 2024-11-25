import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managment_system/Utills/colors.dart';
import 'package:student_managment_system/Utills/global_keys.dart';

import 'header.dart';
import 'responsive.dart';
import 'side_menu.dart';

class AddCourseDialog extends StatefulWidget {
  const AddCourseDialog({super.key});

  @override
  State<AddCourseDialog> createState() => _AddCourseDialogState();
}

class _AddCourseDialogState extends State<AddCourseDialog> {
  TextEditingController courseController = TextEditingController();
  RxBool isLoading = false.obs;

  // List of modules with lessons
  List<Map<String, dynamic>> modules = [];

  void _addModule() {
    setState(() {
      modules.add({
        "moduleTitle": TextEditingController(), // Controller for module title
        "lessons": [], // List of lessons in the module
      });
    });
  }

  void _addLesson(int moduleIndex) {
    setState(() {
      modules[moduleIndex]["lessons"].add({
        "lessonTitle": TextEditingController(), // Controller for lesson title
        "lessonDescription": TextEditingController(), // Lesson description
      });
    });
  }

  Widget _buildTextInput(String label, String hintText,
      {int maxLines = 1, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.primaryColor,
            ),
          ),
          child: TextField(
            maxLines: maxLines,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: addCourseScaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 64,
              child: Header(fct: () {}),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Responsive.isDesktop(context))
                    const SizedBox(
                      width: 250,
                      child: SideMenu(),
                    ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            color: AppColors.secondryColor,
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Add Courses",
                                        style: GoogleFonts.poppins(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: _addModule,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primaryColor,
                                        ),
                                        child: Text(
                                          "Add Module",
                                          style: GoogleFonts.poppins(
                                            color: AppColors.secondryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextInput(
                                      "Course Title", "Enter Course Title",
                                      controller: courseController),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          for (int i = 0; i < modules.length; i++)
                            Card(
                              color: AppColors.secondryColor,
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: _buildTextInput(
                                            "Module Title",
                                            "Enter Module Title",
                                            controller: modules[i]
                                                ["moduleTitle"],
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        ElevatedButton(
                                          onPressed: () => _addLesson(i),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.primaryColor,
                                          ),
                                          child: Text(
                                            "Add Lesson",
                                            style: GoogleFonts.poppins(
                                              color: AppColors.secondryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    for (int j = 0;
                                        j < modules[i]["lessons"].length;
                                        j++)
                                      Card(
                                        color: AppColors.secondryColor,
                                        elevation: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildTextInput(
                                                "Lesson Title",
                                                "Enter Lesson Title",
                                                controller: modules[i]
                                                        ["lessons"][j]
                                                    ["lessonTitle"],
                                              ),
                                              const SizedBox(height: 10),
                                              _buildTextInput(
                                                "Lesson Description",
                                                "Enter Lesson Description",
                                                controller: modules[i]
                                                        ["lessons"][j]
                                                    ["lessonDescription"],
                                                maxLines: 5,
                                              ),
                                            ],
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

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managment_system/Utills/colors.dart';
import '../Controllers/course_controller.dart';
import '../Model/course_model.dart';
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

  Uint8List? imageBytes; // For holding the image data
  String? fileName; // For holding the image file name

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

  Future<void> _pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        setState(() {
          fileName = result.files.single.name;

          if (kIsWeb) {
            // For web, use bytes
            imageBytes = result.files.single.bytes;
          } else {
            // For other platforms, use path (if needed)
            // String? filePath = result.files.single.path;
          }
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
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

  Future<void> _saveCourse() async {
    if (courseController.text.isEmpty) {
      Get.snackbar("Error", "Course title cannot be empty");
      return;
    }

    isLoading.value = true;

    try {
      List<ModuleModel> moduleList = [];
      for (var module in modules) {
        List<LessonModel> lessonList = [];
        for (var lesson in module["lessons"]) {
          lessonList.add(
            LessonModel(
              lessonTitle: lesson["lessonTitle"].text,
              lessonDescription: lesson["lessonDescription"].text,
            ),
          );
        }
        moduleList.add(
          ModuleModel(
            moduleTitle: module["moduleTitle"].text,
            lessons: lessonList,
          ),
        );
      }

      Courses course = Courses(
        courseTitle: courseController.text,
        modules: moduleList,
      );

      CourseController courseControllerInstance = CourseController();
      await courseControllerInstance.saveCourseToFirestore(course);

      Get.snackbar("Success", "Course saved successfully!");
      setState(() {
        modules.clear();
        courseController.clear();
        imageBytes = null; // Reset image
        fileName = null;
      });
    } catch (e) {
      Get.snackbar("Error", "Failed to save course: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  const SizedBox(height: 16),
                                  TextButton(
                                    onPressed: _pickImage,
                                    child: Text(
                                      "Pick Course Image",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  if (imageBytes != null)
                                    Image.memory(
                                      imageBytes!,
                                      height: 200,
                                    ),
                                  if (fileName != null) Text("File: $fileName"),
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
                          const SizedBox(height: 20),
                          Obx(
                            () => ElevatedButton(
                              onPressed: isLoading.value ? null : _saveCourse,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                              ),
                              child: isLoading.value
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      "Save Course",
                                      style: GoogleFonts.poppins(
                                        color: AppColors.secondryColor,
                                        fontWeight: FontWeight.w600,
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

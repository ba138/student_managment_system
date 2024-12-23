import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../Controllers/course_controller.dart';
import '../Model/course_model.dart';
import '../Utills/colors.dart';
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
  TextEditingController courseDescriptionController = TextEditingController();
  RxBool isLoading = false.obs;

  List<Map<String, dynamic>> modules = [];

  Uint8List? imageBytes;
  String? fileName;
  String? imageUrl;

  void _addModule() {
    setState(() {
      modules.add({
        "moduleTitle": TextEditingController(),
        "moduleDescription": TextEditingController(),
        "lessons": [],
      });
    });
  }

  void _addLesson(int moduleIndex) {
    setState(() {
      modules[moduleIndex]["lessons"].add({
        "lessonTitle": TextEditingController(),
        "lessonDescription": TextEditingController(),
      });
    });
  }

  Future<void> _pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        setState(() {
          fileName = result.files.single.name;
          imageBytes = kIsWeb ? result.files.single.bytes : null;
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  Future<String?> _uploadImageToFirebase() async {
    if (imageBytes == null) return null;

    try {
      final ref = FirebaseStorage.instance.ref('courses/$fileName');
      final uploadTask = ref.putData(imageBytes!);
      final snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      debugPrint("Error uploading image: $e");
      Get.snackbar("Error", "Failed to upload image: $e");
      return null;
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
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
        ),
      ],
    );
  }

  Future<void> _saveCourse() async {
    if (courseController.text.isEmpty ||
        courseDescriptionController.text.isEmpty) {
      Get.snackbar("Error", "Course title and description cannot be empty");
      return;
    }

    isLoading.value = true;

    try {
      imageUrl = await _uploadImageToFirebase();

      List<ModuleModel> moduleList = [];
      for (var module in modules) {
        List<LessonModel> lessonList = [];
        for (var lesson in module["lessons"]) {
          lessonList.add(
            LessonModel(
              lessonName: lesson["lessonTitle"].text,
              lessonDescription: lesson["lessonDescription"].text,
            ),
          );
        }
        moduleList.add(
          ModuleModel(
            moduleName: module["moduleTitle"].text,
            lessons: lessonList,
          ),
        );
      }

      Courses course = Courses(
        courseTitle: courseController.text,
        courseDescription: courseDescriptionController.text,
        imageUrl: imageUrl ?? "",
        modules: moduleList,
      );

      CourseController courseControllerInstance = CourseController();
      await courseControllerInstance.saveCourseToFirestore(course);

      Get.snackbar("Success", "Course saved successfully!");
      setState(() {
        modules.clear();
        courseController.clear();
        courseDescriptionController.clear();
        imageBytes = null;
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
            SizedBox(height: 64, child: Header(fct: () {})),
            const SizedBox(height: 12),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Responsive.isDesktop(context)) const SideMenu(),
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
                                  _buildTextInput(
                                      "Course Title", "Enter Course Title",
                                      controller: courseController),
                                  const SizedBox(height: 16),
                                  _buildTextInput(
                                      maxLines: 5,
                                      "Course Description",
                                      "Enter Course Description",
                                      controller: courseDescriptionController),
                                  const SizedBox(height: 16),
                                  TextButton(
                                    onPressed: _pickImage,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Pick Course Image",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(Icons.image,
                                            color: AppColors.primaryColor),
                                      ],
                                    ),
                                  ),
                                  if (imageBytes != null)
                                    Image.memory(imageBytes!, height: 200),
                                  if (fileName != null) Text("File: $fileName"),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: _addModule,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                                minimumSize: const Size(170, 50),
                              ),
                              child: Text(
                                "Add Module",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.secondryColor,
                                  ),
                                ),
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
                                  children: [
                                    Text(
                                      "Module ${i + 1}",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    _buildTextInput(
                                      "Module Title",
                                      "Enter Module Title",
                                      controller: modules[i]["moduleTitle"],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    for (int j = 0;
                                        j < modules[i]["lessons"].length;
                                        j++)
                                      Card(
                                        color: AppColors.secondryColor,
                                        elevation: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Lesson ${j + 1}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              _buildTextInput(
                                                "Lesson Title",
                                                "Enter Lesson Title",
                                                controller: modules[i]
                                                        ["lessons"][j]
                                                    ["lessonTitle"],
                                              ),
                                              _buildTextInput(
                                                maxLines: 5,
                                                "Lesson Description",
                                                "Enter Lesson Description",
                                                controller: modules[i]
                                                        ["lessons"][j]
                                                    ["lessonDescription"],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    ElevatedButton(
                                      onPressed: () => _addLesson(i),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        minimumSize: const Size(170, 50),
                                      ),
                                      child: Text(
                                        "Add Lesson",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(height: 20),
                          Obx(
                            () => Center(
                              child: ElevatedButton(
                                onPressed: isLoading.value ? null : _saveCourse,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  minimumSize: const Size(170, 50),
                                ),
                                child: isLoading.value
                                    ? const CircularProgressIndicator()
                                    : Text(
                                        "Save Course",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.secondryColor,
                                          ),
                                        ),
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

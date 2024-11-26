import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../Model/course_model.dart';

class CourseController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Stores a course along with its modules and lessons in Firestore
  Future<void> saveCourseToFirestore(Courses course) async {
    try {
      // Generate a unique ID for the course
      var courseId = const Uuid().v1();

      // Add the course data to the "Courses" collection
      await _firestore.collection("Courses").doc(courseId).set({
        "courseName": course.courseTitle,
        "courseImage": course.imageUrl,
        "courseDescription": course.courseDescription,
        "courseId": courseId, // Store the unique course ID
      });

      // Iterate through each module in the course
      for (var module in course.modules) {
        // Generate a unique ID for the module
        var moduleId = const Uuid().v1();

        // Add the module data to the "Modules" collection
        await _firestore.collection("Modules").doc(moduleId).set({
          "moduleName": module.moduleTitle,
          "courseId": courseId, // Reference to the parent course
        });

        // Iterate through lessons in the module
        for (var lesson in module.lessons) {
          // Generate a unique ID for the lesson
          var lessonId = const Uuid().v1();

          // Add the lesson data to the "Lessons" collection
          await _firestore.collection("Lessons").doc(lessonId).set({
            "lessonName": lesson.lessonTitle,
            "lessonDescription": lesson.lessonDescription,
            "moduleId": moduleId, // Reference to the parent module
          });
        }
      }

      print("Course, modules, and lessons saved successfully!");
    } catch (e) {
      print("Error saving course: $e");
    }
  }
}

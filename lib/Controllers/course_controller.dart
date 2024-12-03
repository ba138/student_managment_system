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
          "moduleName": module.moduleName,
          "courseId": courseId, // Reference to the parent course
        });

        // Iterate through lessons in the module
        for (var lesson in module.lessons) {
          // Generate a unique ID for the lesson
          var lessonId = const Uuid().v1();

          // Add the lesson data to the "Lessons" collection
          await _firestore.collection("Lessons").doc(lessonId).set({
            "lessonName": lesson.lessonName,
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

  Future<List<Courses>> fetchCoursesWithDetails() async {
    List<Courses> coursesWithDetails = [];

    // Fetch courses
    var coursesSnapshot = await _firestore.collection("Courses").get();

    for (var courseDoc in coursesSnapshot.docs) {
      var courseData = courseDoc.data();
      String courseId = courseDoc.id; // Use document ID if needed

      // Extract course-level data
      String courseTitle = courseData['courseName'] ?? '';
      String imageUrl = courseData['courseImage'] ?? '';
      String courseDescription = courseData['courseDescription'] ?? '';

      // Fetch modules for the course
      var modulesSnapshot = await _firestore
          .collection("Modules")
          .where("courseId", isEqualTo: courseId)
          .get();

      List<ModuleModel> modulesWithLessons = [];

      for (var moduleDoc in modulesSnapshot.docs) {
        var moduleData = moduleDoc.data();
        String moduleTitle = moduleData['moduleName'] ?? '';
        String description = moduleData['description'] ?? '';
        String moduleId = moduleDoc.id; // Use document ID if needed

        // Fetch lessons for the module
        var lessonsSnapshot = await _firestore
            .collection("Lessons")
            .where("moduleId", isEqualTo: moduleId)
            .get();

        List<LessonModel> lessons = lessonsSnapshot.docs.map((lessonDoc) {
          var lessonData = lessonDoc.data();
          return LessonModel(
            lessonName: lessonData['lessonName'] ?? '',
            lessonDescription: lessonData['lessonDescription'] ?? '',
          );
        }).toList();

        // Create a module model and add it to the list
        modulesWithLessons.add(ModuleModel(
          moduleName: moduleTitle,
          lessons: lessons,
        ));
      }

      // Create a course model and add it to the list
      coursesWithDetails.add(Courses(
        courseTitle: courseTitle,
        modules: modulesWithLessons,
        imageUrl: imageUrl,
        courseDescription: courseDescription,
      ));
    }

    return coursesWithDetails;
  }
}

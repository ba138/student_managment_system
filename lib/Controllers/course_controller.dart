import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../Model/course_model.dart';

class CourseController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Stores a course along with its modules and lessons in Firestore
  Future<void> saveCourseToFirestore(Courses course) async {
    try {
      var uid = const Uuid().v1();
      // Add the course data to the "courses" collection
      await _firestore.collection("courses").doc(uid).set(course.toMap());
      print("Course saved successfully!");
    } catch (e) {
      print("Error saving course: $e");
    }
  }
}

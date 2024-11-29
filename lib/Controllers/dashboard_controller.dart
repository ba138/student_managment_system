import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var lesson = 0.obs;
  var courses = 0.obs;
  var modules = 0.obs;
  var students = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchDataFromFirebase();
  }

  Future<void> fetchDataFromFirebase() async {
    try {
      // Reference to Firestore collection
      final firestore = FirebaseFirestore.instance;

      // Fetch data for classes
      final lessonSnapshot = await firestore.collection('Lessons').get();
      final coursesSnapshot = await firestore.collection('Courses').get();
      final modulesSnapshot = await firestore.collection('Modules').get();
      final studentsSnapshot = await firestore.collection('Students').get();

      // Update state with fetched data

      lesson.value = lessonSnapshot.docs.length;
      courses.value = coursesSnapshot.docs.length;
      modules.value = modulesSnapshot.docs.length;
      students.value = studentsSnapshot.docs.length;
    } catch (e) {
      print("Error fetching data from Firebase: $e");
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var lesson = 0.obs;
  var courses = 0.obs;
  var modules = 0.obs;
  var students = 0.obs;
  var groups = 0.obs;
  var users = 0.obs;
  var lessonString = "0".obs;
  var coursesString = "0".obs;
  var modulesString = "0".obs;
  var studentsString = "0".obs;
  var groupsString = "0".obs;
  var usersString = "0".obs;
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
      final userSnapshot = await firestore.collection("users").get();
      final groupSnapshot = await firestore.collection("groups").get();

      // Update state with fetched data

      lesson.value = lessonSnapshot.docs.length;
      courses.value = coursesSnapshot.docs.length;
      modules.value = modulesSnapshot.docs.length;
      students.value = studentsSnapshot.docs.length;
      users.value = userSnapshot.docs.length;
      groups.value = groupSnapshot.docs.length;
      lessonString.value = lessonSnapshot.docs.length.toString();
      coursesString.value = coursesSnapshot.docs.length.toString();
      modulesString.value = modulesSnapshot.docs.length.toString();
      studentsString.value = studentsSnapshot.docs.length.toString();
      usersString.value = userSnapshot.docs.length.toString();
      groupsString.value = groupSnapshot.docs.length.toString();
    } catch (e) {
      print("Error fetching data from Firebase: $e");
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../Model/student_model.dart';

class StudentController extends GetxController {
  var studentList = <Student>[].obs;
  var isLoading = false.obs;
  void onInit() {
    super.onInit();
    fetchAllStudents();
  }

  Future<void> fetchAllStudents() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('Students').get();

      List<Student> students = snapshot.docs
          .map((doc) => Student.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      studentList.assignAll(students);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch students: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

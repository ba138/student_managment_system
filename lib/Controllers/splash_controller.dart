import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:student_managment_system/Pages/LoginScreen/LoginScreen.dart';
import 'package:student_managment_system/Pages/MainPage/main_page.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;
  @override
  void onInit() async {
    super.onInit();
    await seasionHandler();
  }

  Future<void> seasionHandler() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (auth.currentUser == null) {
          Get.offAll(
            () => const Loginscreen(),
          );
        } else {
          Get.offAll(
            () => const MainPage(),
          );
        }
      },
    );
  }
}

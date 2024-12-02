import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managment_system/Controllers/splash_controller.dart';

import '../../Utills/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());

    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      )),
    );
  }
}

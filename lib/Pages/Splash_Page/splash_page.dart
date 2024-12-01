import 'package:flutter/material.dart';
import 'package:student_managment_system/Controllers/splash_controller.dart';

import '../../Utills/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = SplashController();
    splashController.timer(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        )
      ),
    );
  }
}

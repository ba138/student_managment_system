import 'dart:async';

import 'package:flutter/material.dart';
import 'package:student_managment_system/Pages/Home/home_page.dart';

class SplashController {
  Future<void> timer(BuildContext context) async {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (c) => const HomePage(),
        ),
      );
    });
  }
}

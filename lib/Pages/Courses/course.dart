import 'package:flutter/material.dart';

import '../../Utills/global_keys.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: getAddProductscaffoldKey,
      body: const Center(
        child: Text(
          "Courses",
        ),
      ),
    );
  }
}

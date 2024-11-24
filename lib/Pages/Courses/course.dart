import 'package:flutter/material.dart';

import '../../Utills/global_keys.dart';
import '../../Utills/header.dart';
import '../../Utills/responsive.dart';
import '../../Utills/side_menu.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: getAddProductscaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 64,
              child: Header(fct: () {}),
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: Row(
                children: [
                  if (Responsive.isDesktop(context))
                    const SizedBox(
                      width: 250, // Set the width of the side menu
                      child: SideMenu(),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:student_managment_system/Utills/header.dart';
import 'package:student_managment_system/Utills/responsive.dart';

import '../../Utills/global_keys.dart';
import '../../Utills/side_menu.dart';
import '../DashBoard/dashboard.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: getScaffoldKey,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Responsive.isDesktop(context))
                    const SizedBox(
                      width: 250,
                      child: SideMenu(),
                    ),
                  const Expanded(
                    // It takes the remaining part of the screen
                    child: DashboardScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

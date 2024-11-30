import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managment_system/Controllers/dashboard_controller.dart';
import 'package:student_managment_system/Utills/colors.dart';
import 'package:student_managment_system/Utills/liner_chart.dart';
import '../../Utills/dashboard_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DashboardWidget(
                      icon: Icons.cable_outlined,
                      iconColor: AppColors.primaryColor,
                      title: dashboardController.courses.value.toString(),
                      subtitle: 'Total Courses',
                    ),
                    DashboardWidget(
                      icon: Icons.view_module_rounded,
                      iconColor: AppColors.primaryColor,
                      title: dashboardController.modules.value.toString(),
                      subtitle: 'Total Modules',
                    ),
                    DashboardWidget(
                      icon: Icons.class_outlined,
                      iconColor: AppColors.primaryColor,
                      title: dashboardController.lesson.value.toString(),
                      subtitle: 'Total Lessons',
                    ),
                    DashboardWidget(
                      icon: Icons.group_outlined,
                      iconColor: AppColors.primaryColor,
                      title: dashboardController.students.value.toString(),
                      subtitle: 'Total Students',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Add some spacing

            const Align(
              alignment: Alignment.topLeft,
              child: PieChartSample(),
            ),
          ],
        ),
      ),
    );
  }
}

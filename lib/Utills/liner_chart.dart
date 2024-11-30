import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managment_system/Utills/colors.dart';
import '../Controllers/dashboard_controller.dart';

class PieChartSample extends StatelessWidget {
  const PieChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.put(DashboardController());

    return Obx(() {
      // Accessing the values directly from the Rx variables
      double totalModules =
          double.parse(dashboardController.modulesString.value);
      double totalStudents =
          double.parse(dashboardController.studentsString.value);
      double totalCourses =
          double.parse(dashboardController.coursesString.value);
      double totalGroups = double.parse(dashboardController.groupsString.value);
      double totalUsers = double.parse(dashboardController.usersString.value);

      return Card(
        color: AppColors.secondryColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Padding to the whole card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Statistics Graph',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10), // Space between text and chart
              Container(
                constraints: BoxConstraints(
                  maxHeight: 250, // Limit the height
                  maxWidth:
                      MediaQuery.of(context).size.width * 0.4, // Limit width
                ),
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 50,
                    sections: _buildPieSections(
                      totalModules,
                      totalStudents,
                      totalCourses,
                      totalGroups,
                      totalUsers,
                    ),
                  ),
                  duration: const Duration(seconds: 3),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  List<PieChartSectionData> _buildPieSections(
    double totalModules,
    double totalStudents,
    double totalCourses,
    double totalGroups,
    double totalUsers,
  ) {
    List<PieChartSectionData> sections = [];

    sections.add(PieChartSectionData(
      color: Colors.blue,
      value: totalModules,
      title: 'Modules',
      radius: 30,
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ));

    sections.add(PieChartSectionData(
      color: Colors.green,
      value: totalStudents,
      title: 'Students',
      radius: 30,
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ));

    sections.add(PieChartSectionData(
      color: Colors.orange,
      value: totalCourses,
      title: 'Courses',
      radius: 30,
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ));

    sections.add(PieChartSectionData(
      color: Colors.purple,
      value: totalUsers,
      title: 'Users',
      radius: 30,
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ));

    sections.add(PieChartSectionData(
      color: Colors.yellow,
      value: totalGroups,
      title: 'Groups',
      radius: 30,
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ));

    return sections;
  }
}

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
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              Divider(
                color: AppColors.primaryColor,
                thickness: 2,
              ),
              const SizedBox(height: 10), // Space between text and chart
              Container(
                constraints: BoxConstraints(
                  maxHeight: 250, // Limit the height
                  maxWidth: MediaQuery.of(context).size.width *
                      0.8, // Limit width to 80% of screen width
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
              const SizedBox(height: 20), // Space between chart and legend
              // Legend section for color explanations
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildLegendItem(Colors.blue, 'Modules'),
                  const SizedBox(width: 10),
                  _buildLegendItem(AppColors.primaryColor, 'Students'),
                  const SizedBox(width: 10),
                  _buildLegendItem(Colors.orange, 'Courses'),
                  const SizedBox(width: 10),
                  _buildLegendItem(Colors.purple, 'Users'),
                  const SizedBox(width: 10),
                  _buildLegendItem(Colors.yellow, 'Groups'),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        const SizedBox(width: 5), // Space between color and label
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
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
      radius: 30,
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.white,
      ),
    ));

    sections.add(PieChartSectionData(
      color: AppColors.primaryColor,
      value: totalStudents,
      radius: 30,
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.white,
      ),
    ));

    sections.add(PieChartSectionData(
      color: Colors.orange,
      value: totalCourses,
      radius: 30,
      titleStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
    ));

    sections.add(PieChartSectionData(
      color: Colors.purple,
      value: totalUsers,
      radius: 30,
      titleStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
    ));

    sections.add(PieChartSectionData(
      color: Colors.yellow,
      value: totalGroups,
      radius: 30,
      titleStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
    ));

    return sections;
  }
}

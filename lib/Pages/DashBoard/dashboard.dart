import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:student_managment_system/Utills/colors.dart';
import 'package:student_managment_system/Utills/liner_chart.dart';
import '../../Utills/dashboard_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _totalUserCount = 0;
  int _blockedUserCount = 0;
  double _totalFunds = 0.0;
  double _totalwithdraw = 0.0;
  int providerCount = 0;
  int familyCount = 0;

  @override
  Widget build(BuildContext context) {
    String addEllipsis(String text, int maxLength) {
      if (text.length <= maxLength) {
        return text;
      } else {
        return '${text.substring(0, maxLength)}...';
      }
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DashboardWidget(
                    icon: Icons.class_outlined,
                    iconColor: AppColors.primaryColor,
                    title: familyCount.toString(),
                    subtitle: 'Total Classes',
                  ),
                  DashboardWidget(
                    icon: Icons.cable_outlined,
                    iconColor: AppColors.primaryColor,
                    title: providerCount.toString(),
                    subtitle: 'Total Courses',
                  ),
                  DashboardWidget(
                    icon: Icons.view_module_rounded,
                    iconColor: AppColors.primaryColor,
                    title: addEllipsis("0", 6),
                    subtitle: 'Total Modules',
                  ),
                  DashboardWidget(
                    icon: Icons.group_outlined,
                    iconColor: AppColors.primaryColor,
                    title: addEllipsis("0", 6),
                    subtitle: 'Total Students',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some spacing

            SizedBox(
              height: 400, // Adjust height as needed
              child: Card(
                  color: AppColors.secondryColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          top: 12,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Statistics Graph',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Add spacing for the chart
                      const LineChartSample2(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

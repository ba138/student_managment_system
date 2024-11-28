import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:student_managment_system/Utills/colors.dart';
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
            Text(
              'User Statistics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10), // Add spacing for the chart
            SizedBox(
              height: 200, // Adjust height as needed
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 23,
                          color: AppColors.primaryColor,
                        ),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 45,
                          color: AppColors.primaryColor,
                        ),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return Text('Families',
                                  style: TextStyle(fontSize: 10));
                            case 1:
                              return Text('Providers',
                                  style: TextStyle(fontSize: 10));
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border.symmetric(
                      horizontal: BorderSide(
                          color: Colors.grey, width: 1), // Bottom border
                      vertical: BorderSide(
                          color: Colors.grey, width: 1), // Right border
                    ),
                  ),
                  gridData: const FlGridData(show: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

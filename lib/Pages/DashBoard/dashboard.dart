import 'package:flutter/material.dart';
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

  @override
  // void initState() {
  //   super.initState();
  //   fetchCounts();
  // }

  int providerCount = 0;
  int familyCount = 0;

  // Future<void> fetchCounts() async {
  //   try {
  //     // References to the 'providers' and 'families' nodes
  //     DatabaseReference providersRef =
  //         FirebaseDatabase.instance.ref('Providers');
  //     DatabaseReference familiesRef = FirebaseDatabase.instance.ref('Family');

  //     // Fetch the data once from both nodes
  //     DataSnapshot providersSnapshot = await providersRef.get();
  //     DataSnapshot familiesSnapshot = await familiesRef.get();

  //     // Assign the number of children in each node to the respective variables
  //     setState(() {
  //       providerCount = providersSnapshot.children.length;
  //       familyCount = familiesSnapshot.children.length;
  //     });
  //   } catch (e) {
  //     print('Error fetching counts: $e');
  //   }
  // }

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
      child: Container(
        height: 232,
        color: AppColors.secondryColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DashboardWidget(
                  icon: Icons.class_outlined,
                  iconColor: AppColors.primaryColor,
                  title: familyCount.toString(),
                  subtitle: 'Total Classes'),
              DashboardWidget(
                  icon: Icons.cable_outlined,
                  iconColor: AppColors.primaryColor,
                  title: providerCount.toString(),
                  subtitle: 'Total Courses'),
              DashboardWidget(
                  icon: Icons.view_module_rounded,
                  iconColor: AppColors.primaryColor,
                  title: addEllipsis(
                    "0",
                    6, // Maximum length before adding ellipsis
                  ),
                  subtitle: 'Total Modules'),
              DashboardWidget(
                  icon: Icons.group_outlined,
                  iconColor: AppColors.primaryColor,
                  title: addEllipsis(
                    "0",
                    6, // Maximum length before adding ellipsis
                  ),
                  subtitle: 'Total  Students'),
            ],
          ),
        ),
      ),
    ));
  }
}

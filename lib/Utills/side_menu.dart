import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managment_system/Pages/Courses/course.dart';
import 'package:student_managment_system/Pages/Groups/group_detail_page.dart';
import 'package:student_managment_system/Pages/MainPage/main_page.dart';
import 'package:student_managment_system/Pages/User_page.dart/users_detail_page.dart';
import 'package:student_managment_system/Pages/student_detail_page.dart';

import 'colors.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String _selectedTab = "Dashboard"; // Keeps track of the selected tab

  void _onTabSelected(String tabName, Widget page) {
    setState(() {
      _selectedTab = tabName;
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.red.shade50, // Light red background color
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        children: [
          DrawerListTile(
            title: "Dashboard",
            isSelected: _selectedTab == "Dashboard",
            press: () => _onTabSelected("Dashboard", const MainPage()),
            icon: Icons.home_outlined,
          ),
          DrawerListTile(
            title: "Courses",
            isSelected: _selectedTab == "Courses",
            press: () => _onTabSelected("Courses", const CoursePage()),
            icon: Icons.cable_outlined,
          ),
          DrawerListTile(
            title: "Users",
            isSelected: _selectedTab == "Users",
            press: () => _onTabSelected("Users", const UserDetailPage()),
            icon: Icons.person_2_outlined,
          ),
          DrawerListTile(
            title: "Groups",
            isSelected: _selectedTab == "Groups",
            press: () => _onTabSelected("Groups", const GroupDetailPage()),
            icon: Icons.data_exploration_outlined,
          ),
          DrawerListTile(
            title: "Students",
            isSelected: _selectedTab == "Students",
            press: () => _onTabSelected("Students", const StudentDetailPage()),
            icon: Icons.group_outlined,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.press,
    this.imageIcon,
    this.icon,
    this.isSelected = false,
  });

  final String title;
  final VoidCallback press;
  final String? imageIcon;
  final IconData? icon;
  final bool isSelected; // Indicates if the tab is selected

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: imageIcon != null
          ? ImageIcon(
        AssetImage(
          imageIcon!,
        ),
        color: isSelected ? Colors.red : AppColors.blackColor,
        size: 20,
      )
          : Icon(
        icon,
        color: isSelected ? Colors.red : AppColors.blackColor,
        size: 20,
      ),
      minLeadingWidth: 40,
      title: Text(
        title,
        style: GoogleFonts.getFont(
          "Poppins",
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.red : AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}

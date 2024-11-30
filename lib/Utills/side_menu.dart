import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managment_system/Pages/Courses/course.dart';
import 'package:student_managment_system/Pages/Groups/group_detail_page.dart';
import 'package:student_managment_system/Pages/MainPage/main_page.dart';
import 'package:student_managment_system/Pages/User_page.dart/users_detail_page.dart';
import 'package:student_managment_system/Pages/student_detail_page.dart';

import 'colors.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    super.key,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        children: [
          DrawerListTile(
            title: "Dashboard",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ),
              );
            },
            icon: Icons.home_outlined,
          ),
          DrawerListTile(
            title: "Courses",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const CoursePage(),
                ),
              );
            },
            icon: Icons.cable_outlined,
          ),
          DrawerListTile(
            title: "Users",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const UserDetailPage(),
                ),
              );
            },
            icon: Icons.person_2_outlined,
          ),
          DrawerListTile(
            title: "Groups",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const GroupDetailPage(),
                ),
              );
            },
            icon: Icons.data_exploration_outlined,
          ),
          DrawerListTile(
            title: "Students",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const StudentDetailPage(),
                ),
              );
            },
            icon: Icons.group_outlined,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      // For selecting those three line once press "Command+D"
      required this.title,
      required this.press,
      this.imageIcon,
      this.icon});

  final String title;
  final VoidCallback press;
  final String? imageIcon;
  final IconData? icon;
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
              color: AppColors.blackColor,
              size: 20,
            )
          : Icon(
              icon,
              color: AppColors.blackColor,
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
            color: AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}

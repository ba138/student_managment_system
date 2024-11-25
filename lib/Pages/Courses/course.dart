import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managment_system/Utills/add_course_dialog.dart';
import 'package:student_managment_system/Utills/colors.dart';

import '../../Utills/global_keys.dart';
import '../../Utills/header.dart';
import '../../Utills/responsive.dart';
import '../../Utills/side_menu.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: getCourseScaffoldKey,
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
                      width: 250, // Set the width of the side menu
                      child: SideMenu(),
                    ),
                  Expanded(
                    // flex: 5,
                    // It takes the remaining part of the screen
                    child: SingleChildScrollView(
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            //     ? 650
                            //     : MediaQuery.of(context).size.width,
                            color: AppColors.secondryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Courses",
                                      style: GoogleFonts.getFont(
                                        "Poppins",
                                        textStyle: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 38,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              left: BorderSide(
                                                color: AppColors.primaryColor,
                                                width:
                                                    1.0, // Adjust the width as needed
                                              ),
                                              top: BorderSide(
                                                color: AppColors.primaryColor,
                                                width:
                                                    1.0, // Adjust the width as needed
                                              ),
                                              bottom: BorderSide(
                                                color: AppColors.primaryColor,
                                                width:
                                                    1.0, // Adjust the width as needed
                                              ),
                                              // No border on the right side
                                              right: BorderSide.none,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                            ),
                                          ),
                                          child: const TextField(
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              hintText: 'Search here',
                                              hintStyle: TextStyle(
                                                  color: Colors.black),
                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.search,
                                                  color: Colors.black),
                                            ),
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 38,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                13,
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Search",
                                                style: GoogleFonts.getFont(
                                                  "Poppins",
                                                  textStyle: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColors.secondryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (c) =>
                                                    const AddCourseDialog(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 38,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                13,
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Add Course",
                                                style: GoogleFonts.getFont(
                                                  "Poppins",
                                                  textStyle: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColors.secondryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   width: MediaQuery.sizeOf(context).width,
                  //   color: AppColors.secondryColor,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

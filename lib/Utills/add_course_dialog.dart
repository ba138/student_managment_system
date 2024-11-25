import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managment_system/Utills/colors.dart';
import 'package:student_managment_system/Utills/global_keys.dart';

import 'header.dart';
import 'responsive.dart';
import 'side_menu.dart';

class AddCourseDialog extends StatefulWidget {
  const AddCourseDialog({super.key});

  @override
  State<AddCourseDialog> createState() => _AddCourseDialogState();
}

class _AddCourseDialogState extends State<AddCourseDialog> {
  TextEditingController titleController = TextEditingController();
  RxBool isLogin = false.obs;
  final List<Widget> lessonCards = [];
  void _addLessonCard() {
    setState(() {
      lessonCards.add(SizedBox(
        width: MediaQuery.sizeOf(context).width / 3,
        child: Card(
          color: AppColors.secondryColor,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lesson Title",
                  style: GoogleFonts.getFont(
                    "Poppins",
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 38,
                  width: MediaQuery.of(context).size.width / 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        hintText: 'Lesson Title',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Lesson Discription",
                  style: GoogleFonts.getFont(
                    "Poppins",
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 10,
                      decoration: InputDecoration(
                          hintText: "Lesson Discription",
                          border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Save Lesson",
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ));
    });
    titleController.clear(); // Clear the text field
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: addCourseScaffoldKey,
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
                    // It takes the remaining part of the screen
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, right: 16),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: AppColors.secondryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Add Courses",
                                              style: GoogleFonts.getFont(
                                                "Poppins",
                                                textStyle: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: _addLessonCard,
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
                                                    "Add Lesson",
                                                    style: GoogleFonts.getFont(
                                                      "Poppins",
                                                      textStyle: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColors
                                                            .secondryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Course Title",
                                                        style:
                                                            GoogleFonts.getFont(
                                                          "Poppins",
                                                          textStyle: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .blackColor,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 38,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            8,
                                                          ),
                                                          border: Border.all(
                                                            color: AppColors
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: TextField(
                                                            controller:
                                                                titleController,
                                                            decoration:
                                                                const InputDecoration(
                                                              isDense: true,
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          8.0),
                                                              hintText:
                                                                  'Course Title',
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                            textAlignVertical:
                                                                TextAlignVertical
                                                                    .center,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Module Title",
                                                        style:
                                                            GoogleFonts.getFont(
                                                          "Poppins",
                                                          textStyle: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .blackColor,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 38,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            8,
                                                          ),
                                                          border: Border.all(
                                                            color: AppColors
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: TextField(
                                                            controller:
                                                                titleController,
                                                            decoration:
                                                                const InputDecoration(
                                                              isDense: true,
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          8.0),
                                                              hintText:
                                                                  'Module Title',
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                            textAlignVertical:
                                                                TextAlignVertical
                                                                    .center,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: lessonCards,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

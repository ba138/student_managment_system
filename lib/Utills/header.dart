import 'package:flutter/material.dart';

import 'colors.dart';
import 'notification_badge.dart';
import 'responsive.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.fct,
  });

  final Function fct;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                fct();
              },
            ),
          if (Responsive.isDesktop(context))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Nanny Fairy",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          if (Responsive.isDesktop(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
          Expanded(
            child: Container(
              width: 204,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "Search",
                  fillColor: Colors.transparent,
                  filled: true,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16 / 2),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: const Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 64.0),
          const NotificationIconWithBadge(notificationCount: 5),
        ],
      ),
    );
  }
}

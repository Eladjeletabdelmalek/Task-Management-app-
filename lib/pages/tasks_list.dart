import 'package:flutter/material.dart';
import 'package:flutter_application_test/components/AmbientBackground.dart';
import 'package:flutter_application_test/components/colors_set.dart';
import 'package:flutter_application_test/components/custom_nav_bar.dart';
import 'package:flutter_svg/svg.dart' as flutter_svg;

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(selectedIndex: 2),
      body: AmbientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              spacing: 30,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: flutter_svg.SvgPicture.asset(
                        'assets/icons/Arrow - Left.svg',
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Add Project',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: flutter_svg.SvgPicture.asset(
                        'assets/icons/notification.svg',
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Container(
                  width: 330,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF0F0F5), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.10),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                  child: Row(
                    spacing: 8,
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorsSet.lightOfficeTasksCOlor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: flutter_svg.SvgPicture.asset(
                            "assets/icons/briefcase.svg",
                            colorFilter: ColorFilter.mode(
                              ColorsSet.OfficeTasksCOlor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Task Group',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: ColorsSet.lighttextColor,
                            ),
                          ),
                          Text(
                            'Work',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorsSet.textColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: flutter_svg.SvgPicture.asset(
                            'assets/icons/Arrow - Down 4.svg',
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 140,
                  width: 330,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF0F0F5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        "Description",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 11, color: ColorsSet.lighttextColor),
                      ),
                      Text(
                        "This application is designed for super shops. By using this "
                        "application they can enlist all their products in one place and "
                        "can deliver. Customers will get a one-stop solution for their "
                        "daily shopping.",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, color: ColorsSet.textColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 330,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF0F0F5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
                  child: Row(
                    spacing: 8,
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: flutter_svg.SvgPicture.asset(
                            "assets/icons/calendar.svg",
                            colorFilter: ColorFilter.mode(
                              ColorsSet.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start date',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: ColorsSet.lighttextColor,
                            ),
                          ),
                          Text(
                            'time', // TODO: wire to actual selected date
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorsSet.textColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: flutter_svg.SvgPicture.asset(
                            'assets/icons/Arrow - Down 4.svg',
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),


     Container(
                  width: 330,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF0F0F5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
                  child: Row(
                    spacing: 8,
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: flutter_svg.SvgPicture.asset(
                            "assets/icons/calendar.svg",
                            colorFilter: ColorFilter.mode(
                              ColorsSet.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End date',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: ColorsSet.lighttextColor,
                            ),
                          ),
                          Text(
                            'time', // TODO: wire to actual selected date
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorsSet.textColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: flutter_svg.SvgPicture.asset(
                            'assets/icons/Arrow - Down 4.svg',
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_test/components/AmbientBackground.dart';
import 'package:flutter_application_test/components/colors_set.dart';
import 'package:flutter_application_test/components/custom_nav_bar.dart';
import 'package:flutter_application_test/components/progress_task_card.dart';
import 'package:flutter_svg/svg.dart' as flutter_svg;
import 'package:google_fonts/google_fonts.dart';

class TasksSettings extends StatefulWidget {
  const TasksSettings({super.key});

  @override
  State<TasksSettings> createState() => _TasksSettingsState();
}

class _TasksSettingsState extends State<TasksSettings> {
  final List<String> taskTypeProgress = [
    "All","To Do","In Progress","Coming","Done"
  ];
  final DateTime _now = DateTime.now();
  int _selectedIndex = DateTime.now().day - 1; // Default select today
  int seIndex = 0; // Default select today
  final double _itemWidth = 74.0;
  final double _itemMargin = 16.0;
  ScrollController scrollController() {
    return ScrollController(
      initialScrollOffset: (_selectedIndex * (_itemWidth + _itemMargin)) - (MediaQuery.of(context).size.width / 2) + (_itemWidth / 2),
    );
  }
  // Array helpers for formatted names
  final List<String> _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  final List<String> _weekdays = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
  ];

  // Helper function to calculate total days in the current month
  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }
  @override
  Widget build(BuildContext context) {
    final int daysInMonth = _getDaysInMonth(_now.year, _now.month);
    return Scaffold(
      bottomNavigationBar: CustomNavBar(selectedIndex: 1),
      body: AmbientBackground(
        child: SafeArea(
          left:true,
          child: Center(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    IconButton(
                      icon: flutter_svg.SvgPicture.asset(
                  'assets/icons/Arrow - Left.svg',
                ),
                      color: Colors.black,
                      onPressed:(){
                        Navigator.pop(context);
                      },
                    ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Today Tasks',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color:Colors.black)
                    ),
                  ),
                  IconButton(
                      icon: flutter_svg.SvgPicture.asset(
                        'assets/icons/notification.svg',
                        
                      ),
                      color: Colors.black,
                      onPressed:(){
                        // Navigator.pop(context);
                      },
                    ),
                  ]
                ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController(),
                  itemCount: daysInMonth,
                  itemBuilder: (context, index) {
                    final int dayNumber = index + 1;
                    final DateTime date = DateTime(_now.year, _now.month, dayNumber);
                    final String weekdayName = _weekdays[date.weekday - 1];
                    final String monthName = _months[_now.month - 1];
                    final bool isSelected = index == _selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
        color: date.day==_now.day ? ColorsSet.primaryColor:ColorsSet.CardColor,
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
                        width: _itemWidth,
                        height: 84,
                        margin: EdgeInsets.symmetric(horizontal: _itemMargin / 2),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                monthName,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,
                                color: date.day==_now.day ? ColorsSet.reversedtextColor:ColorsSet.textColor
                                ),
                              ),
                              const SizedBox(height: 4),
                              Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  '$dayNumber',
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                                  color: date.day==_now.day ? ColorsSet.reversedtextColor:ColorsSet.textColor
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                weekdayName,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,
                                color: date.day==_now.day ? ColorsSet.reversedtextColor:ColorsSet.textColor
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ),
              SizedBox(
        height: 40, // Height constraint for horizontal list
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: taskTypeProgress.length,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final bool isSelected = seIndex == index;
            final String title = taskTypeProgress[index];
        
            return GestureDetector(
              onTap: () {
                setState(() {
                  seIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                // NO width specified -> container automatically expands to fit text + padding
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? ColorsSet.primaryColor
                      : ColorsSet.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: GoogleFonts.lexendDeca(
                      fontSize: 14,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSelected ? Colors.white : ColorsSet.primaryColor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
            ),
            Expanded(
                    child: SizedBox(
                      height: 200,
                      child: ListView.separated(
                        padding: EdgeInsets.all(8),
                        shrinkWrap: true,
                        itemCount: 8,
                        separatorBuilder: (context, index) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return ProgressTaskCard();
                                
                          
                        },
                      ),
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
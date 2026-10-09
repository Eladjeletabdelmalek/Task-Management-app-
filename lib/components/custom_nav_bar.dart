import 'package:flutter_application_test/components/colors_set.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/pages/Profile.dart';
import 'package:flutter_application_test/pages/Tasks_settings.dart';
import 'package:flutter_application_test/pages/home.dart';
import 'package:flutter_application_test/pages/tasks_list.dart';
import 'package:flutter_svg/svg.dart' as flutter_svg;

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.selectedIndex});
  final int selectedIndex;
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => page,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
  final Color primaryColor = ColorsSet.primaryColor;
  
  // Inactive state uses the primary color with 40% opacity (0.4)
  final Color activeColor = primaryColor.withValues(alpha: 100);
  final Color inactiveColor = primaryColor; 

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30)
    ),
    height: 50,
    child: ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(30),
      child: StylishBottomBar(
        elevation: 1,
        borderRadius: BorderRadius.circular(30),
        option: AnimatedBarOptions(
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.simple,
          opacity: 0.3,
        ),
        backgroundColor: ColorsSet.secondaryColor,
        currentIndex: selectedIndex,
        items: [
          // 1. Home
          BottomBarItem(
            icon: flutter_svg.SvgPicture.asset(
              'assets/icons/home.svg',
              colorFilter: ColorFilter.mode(
                selectedIndex == 0 ? activeColor : inactiveColor,
                BlendMode.srcIn,
              ),
            ),
            title: const Text('Home'),
          ),
      
          // 2. Calendar
          BottomBarItem(
            icon: flutter_svg.SvgPicture.asset(
              'assets/icons/calendar.svg',
              colorFilter: ColorFilter.mode(
                selectedIndex == 1 ? activeColor : inactiveColor,
                BlendMode.srcIn,
              ),
            ),
            title: const Text('Calendar'),
          ),
      
          // 3. Tasks
          BottomBarItem(
            icon: flutter_svg.SvgPicture.asset(
              'assets/icons/document-text.svg',
              colorFilter: ColorFilter.mode(
                selectedIndex == 2 ? activeColor : inactiveColor,
                BlendMode.srcIn,
              ),
      
            ),
            title: const Text('Tasks'),
          ),
      
          // 4. Profile
          BottomBarItem(
            icon: flutter_svg.SvgPicture.asset(
              'assets/icons/profile-2user.svg',
              colorFilter: ColorFilter.mode(
                selectedIndex == 3 ? activeColor : inactiveColor,
                BlendMode.srcIn,
              ),
            ),
            title: const Text('Profile'),
          ),
        ],
        onTap: (index) {
          if (index == selectedIndex) return;
      
          switch (index) {
            case 0:
              _navigateTo(context, HomePage());
              break;
            case 1:
              _navigateTo(context, TasksSettings());
              break;
            case 2:
              _navigateTo(context, TasksList());
              break;
            case 3:
              _navigateTo(context, Profile());
              break;
          }
        },
      ),
    ),
  );
}
}

















class NavigationColorMapper extends flutter_svg.ColorMapper {
  final Color targetColor;

  const NavigationColorMapper({required this.targetColor});

  @override
  Color substitute(
    String? id, 
    String elementName, 
    String attributeName, 
    Color color,
  ) {
    // Check if the current element attribute is a fill or stroke
    if (attributeName == 'fill' || attributeName == 'stroke') {
      
      // OPTION A: Replace ONLY the main dark/black lines 
      // (Change 0xFF000000 to match the exact hex code of your main icon lines)
      if (color.toARGB32() == 0xFF000000) {
        return targetColor;
      }
      
      // OPTION B: Alternatively, if you want to change everything EXCEPT the small accent parts,
      // you can tell it to skip a specific accent color (e.g., skip pure white or a specific grey)
      // if (color.value == 0xFFFFFFFF) return color; 
    }

    // Leave everything else (like your small accent parts) completely original
    return color;
  }
}
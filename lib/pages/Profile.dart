import 'package:flutter/material.dart';
import 'package:flutter_application_test/components/AmbientBackground.dart';
import 'package:flutter_application_test/components/User_Data_Card.dart';
import 'package:flutter_application_test/components/colors_set.dart';
import 'package:flutter_application_test/components/custom_nav_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(selectedIndex: 3),
      body: AmbientBackground(
        child: SafeArea(
          left:true,
          right:true,
          child: Center(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 88,
                  width: 88,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.10),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Icon(Icons.person, color: ColorsSet.textColor, size: 44),
                ),
                Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsSet.textColor,
                  ),
                ),
                Column(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(
                      'Email',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:ColorsSet.textColor)
                      ),
                      UserDataCard(dataController: TextEditingController(text: 'user@example.com')),
                   Text(
                      'Position',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:ColorsSet.textColor)
                      ),
                      UserDataCard(dataController: TextEditingController(text: 'user@example.com')),
                    Text(
                      'Phone',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:ColorsSet.textColor)
                      ),
                      UserDataCard(dataController: TextEditingController(text: 'user@example.com')),
                    Text(
                      'Location',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:ColorsSet.textColor)
                      ),
                      UserDataCard(dataController: TextEditingController(text: 'user@example.com')),

                  ],
                  ),
              SizedBox(height: 20),
              Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    width: 165,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Modify account action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsSet.primaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Modify Account',
                        style: TextStyle(fontSize: 14, color: ColorsSet.reversedtextColor),
                      ),
                    ),
                  ),


                  SizedBox(
                    width: 165,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle delete account action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsSet.DeletColor,
                        foregroundColor: ColorsSet.reversedtextColor, // text + ripple color
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Delete Account',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
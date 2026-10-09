import 'package:flutter/material.dart';
import 'package:flutter_application_test/components/AmbientBackground.dart';
import 'package:flutter_application_test/components/colors_set.dart';
import 'package:flutter_application_test/pages/home.dart';
import 'package:flutter_svg/svg.dart' as flutter_svg;

class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AmbientBackground(
        child: Column(
          children: [
            SizedBox(height:550),
            Text(
              'Welcome to the App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black),
            ),
            SizedBox(height:20),
            Text('This is the onboarding screen of the app.',style: TextStyle(fontSize: 12,color:Colors.black,fontWeight:FontWeight.w300)),
            Text('You can add more information about the app here.',style: TextStyle(fontSize: 12,color:Colors.black,fontWeight:FontWeight.w300),),
            SizedBox(height:50),
            SizedBox(
          width: 320,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              // Navigate to the next screen
              Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsSet.primaryColor,
              shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
        const Text(
          'Get Started',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        
        flutter_svg.SvgPicture.asset(
          'assets/icons/Arrow - Right.svg',
          width: 24,
          height: 24,
          color: Colors.white,
        ),
              ],
            ),
          ),
        )
          ]
            
        ),
      )
    );
  }
}
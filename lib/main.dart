import 'package:flutter/material.dart';
import 'package:flutter_application_test/pages/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.lexendDecaTextTheme(
        Theme.of(context).textTheme,
        ),
        colorScheme: .fromSeed(seedColor: Colors.blue[100]!),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    
    return onboarding();
    // Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: Column(
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children:[
    //             IconButton(
    //               icon: const Icon(Icons.arrow_back_rounded,),
    //               color: Colors.black,
    //               onPressed:(){
    //                 // Navigator.pop(context);
    //               },
    //             ),
    //           ]
    //         ),
    //         const Text('some bullshit'),
    //         const SizedBox(height: 10),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //            MyCard(title:"Card 1"),
    //            MyCard(title:"Card 1"),
    //            MyCard(title:"Card 1"),
    //            MyCard(title:"Card 1"),

    //           ]
                
    //           ),

    //       ],
    //     ),
    //   ),
    // );
  }
}

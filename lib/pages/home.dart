import 'package:flutter/material.dart';
import 'package:flutter_application_test/components/AmbientBackground.dart';
import 'package:flutter_application_test/components/colors_set.dart';
import 'package:flutter_application_test/components/custom_nav_bar.dart';
import 'package:flutter_application_test/components/task_card.dart';
import 'package:flutter_application_test/components/task_type_card.dart';
import 'package:flutter_application_test/models/model_list.dart';
import 'package:flutter_svg/svg.dart' as flutter_svg;
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();

}
double taskcompletionpercentage(DateTime startDate,DateTime endDate){
    final now = DateTime.now();

  final totalDuration = endDate.difference(startDate).inMilliseconds;
  final elapsedDuration = now.difference(startDate).inMilliseconds;

  if (totalDuration <= 0) return 100.0;

  final progress = (elapsedDuration / totalDuration) * 100;

  return progress.clamp(0.0, 100.0);
  }
  

class _HomePageState extends State<HomePage> {
  
  
  double taskcomplition= taskcompletionpercentage(Users?[1].tasks?[0].startDate ?? DateTime.now(), Users?[1].tasks?[0].endDate ?? DateTime.now())/100;
  int inprogressTaskCount = Users?[1].tasks?.where((task) => !task.isCompleted).length ?? 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: CustomNavBar(selectedIndex: 0),
      body:AmbientBackground(
        child: SafeArea(
          left: true,
          right: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child:Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: ColorsSet.CardColor,
                        child: IconButton(
                          icon: const Icon(Icons.person,),
                          color: Colors.black,
                          onPressed:(){
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello !',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300,color:ColorsSet.textColor)
                          ),
                          Text(
                            '${Users?[1].name}',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:ColorsSet.textColor)
                          ),
                        ]
                      ),
                      Spacer(),
                        IconButton(
                          icon: flutter_svg.SvgPicture.asset(
                            'assets/icons/notification.svg',
                            color: ColorsSet.textColor,
                          ),
                          color: ColorsSet.textColor,
                          onPressed:(){
                            // Navigator.pop(context);
                          },
                        ),
                    ]
                  ),
                Container(
                  padding: EdgeInsets.all(15),
                  height: 145,
                  width: 330,
                  // decoration: BoxDecoration(
                  //   color: ColorsSet.primaryColor,
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  decoration: BoxDecoration(
                    color: ColorsSet.primaryColor,
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
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Column(
                          children:[
                             Text("Your today task",style: TextStyle(color: ColorsSet.CardColor),),
                             Text("Almost done!",style: TextStyle(color: ColorsSet.CardColor),),
                             Spacer(),
                             ElevatedButton(
                              onPressed:(){},
                              style: ElevatedButton.styleFrom(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 backgroundColor:  ColorsSet.secondaryColor,
                      
                              ),
                               child: Text("View Task",style: TextStyle(color: ColorsSet.primaryColor),)
                               )
                          ]
                        ),
                        Expanded(
                          child:Center(
                            child: CircularPercentIndicator(
                            reverse: true,  
                            animation: true,
                            radius: 40,
                            lineWidth: 10,
                            percent: taskcomplition,
                            progressColor: ColorsSet.secondaryColor,
                            backgroundColor: ColorsSet.BackgroundpercentageColor,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text("${(taskcomplition * 100).round()}",style: TextStyle(fontSize: 14,color: Colors.white),),
                            ),
                          ),
                          ),
                        Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorsSet.BackgroundpercentageColor,
                          ),
                          height: 24,
                          width:24,
                          child: Icon(Icons.more_horiz,color: Colors.white,),
                        )
              
                      ]
                    ),
                  ),
                ),  
                Row(
                  spacing: 5,
                  children: [
                    Text('In Progress',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:ColorsSet.textColor)),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: ColorsSet.secondaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$inprogressTaskCount',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color:ColorsSet.primaryColor),
                        ),
                      )
                      )
                  ],
                ),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width:15),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return  TaskCard(
                        taskTitleController: TextEditingController(text: Users?[1].tasks?[1].title ?? "Task Title"),
                        taskTypeController: TextEditingController(text: Users?[1].tasks?[1].title ?? "Task Type"),
                        taskprogressController: TextEditingController(text: "${taskcompletionpercentage(Users?[1].tasks?[1].startDate ?? DateTime.now(), Users?[1].tasks?[1].endDate ?? DateTime.now())}"),
                      );
                      //  Container(
                      //   decoration: BoxDecoration(
                      //     color: ColorsSet.primaryColor,
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      //   height: 115,
                      //   width: 250,
                      //   margin: const EdgeInsets.only(right: 12),
                      //   child: Center(
                      //     child: Text('Card ${index + 1}',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:ColorsSet.reversedtextColor),),
                      //   ),
                      // );
                      
                    },
                  ),
                ), 
                Row(
                  spacing: 5,
                  children: [
                    Text('Task groupes',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:ColorsSet.textColor)),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: ColorsSet.secondaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color:ColorsSet.primaryColor),
                        ),
                      )
                      )
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(8),
                    shrinkWrap: true,
                    itemCount: 8,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return TaskTypeCard();
                            
                      
                    },
                  ),
                ),
                ]
                )
                ),
          ),
        ),
      )
    );
  }
}



// Container(
                    //   decoration: BoxDecoration(
                    //     color: ColorsSet.primaryColor,
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   height: 60,
                    //   width: double.infinity,
                    //   margin: const EdgeInsets.only(bottom: 12),
                    //   child: Center(
                    //     child: Text('Task Group ${index + 1}',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:ColorsSet.reversedtextColor),
                    //   ),
                    // ));
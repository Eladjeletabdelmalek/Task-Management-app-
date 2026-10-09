import 'package:flutter/material.dart';
import 'package:flutter_application_test/components/colors_set.dart';
import 'package:flutter_svg/svg.dart' as flutter_svg;
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskTypeCard extends StatefulWidget {
  const TaskTypeCard({super.key});

  @override
  State<TaskTypeCard> createState() => _TaskTypeCardState();
}

class _TaskTypeCardState extends State<TaskTypeCard> {
  int task_number = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
      
      height: 70,
      width:335,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                color:ColorsSet.lightDailyStudyColor,
                borderRadius: BorderRadius.circular(8)
              ),
               
               height: 35,
               width: 35,
               child:Center(
                 child: flutter_svg.SvgPicture.asset(
                   'assets/icons/book.svg',
                  color: ColorsSet.DailyStudyColor, 
                   
                 ),
                ),
                  ),
          SizedBox(width: 10,),      
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Daily Study'),
              Text('${task_number}Tasks'),
            ],
          ), 
          Spacer(),      
          CircularPercentIndicator(
            reverse: true,
            animation: true,
            radius: 25,
            lineWidth: 5,
            percent: 0.7,
            progressColor: ColorsSet.DailyStudyColor,
            backgroundColor: ColorsSet.lightDailyStudyColor,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text("70%",style: TextStyle(fontSize: 14),),
          ),
      ],)
    );
  }
  }

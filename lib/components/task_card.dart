import 'package:flutter/material.dart';
import 'package:flutter_application_test/components/colors_set.dart';
import 'package:flutter_svg/svg.dart' as flutter_svg;

class TaskCard extends StatefulWidget {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskTypeController = TextEditingController();
  TextEditingController taskprogressController = TextEditingController();
  TaskCard({super.key,required this.taskTitleController, required this.taskTypeController, required this.taskprogressController});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(20),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsSet.lightTodoColor
      ),
      height: 115,
      width:  250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Row(
            spacing:20,
            children:[
             Text(widget.taskTypeController.text,style:TextStyle(fontSize: 14,color: ColorsSet.lighttextColor)),
             Spacer(),
             Container(
              height:24,
              width:24,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color:ColorsSet.lightOfficeTasksCOlor
              ),
              child:Padding(
                padding: const EdgeInsets.all(4.0),
                child: flutter_svg.SvgPicture.asset(
                  width:8,
                  height:8,
                  "assets/icons/briefcase.svg",
                  color: ColorsSet.OfficeTasksCOlor,
                ),
              )
             )
            ]
          ),
          Expanded(child: Text(widget.taskTitleController.text,style:TextStyle(fontSize: 36,color:ColorsSet.textColor))),
          LinearProgressIndicator(
            backgroundColor: ColorsSet.CardColor,
            color: ColorsSet.TodoColor,
            value:0.6,
            minHeight: 6,
            borderRadius: BorderRadius.circular(20),
          ),
        ]
      ),
    );
}}
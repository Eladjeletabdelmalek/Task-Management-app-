import 'package:flutter/material.dart';
import 'package:flutter_application_test/components/colors_set.dart';
import 'package:flutter_svg/svg.dart' as flutter_svg;

class ProgressTaskCard extends StatefulWidget {
  const ProgressTaskCard({super.key});

  @override
  State<ProgressTaskCard> createState() => _ProgressTaskCardState();
}

class _ProgressTaskCardState extends State<ProgressTaskCard> {
  final int _now = DateTime.now().hour;
  final int minute_now = DateTime.now().minute;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          // Row 1: Category Title & Icon
          Row(
            children: [
              Text(
                "Task Title",
                style: TextStyle(
                  fontSize: 14,
                  color: ColorsSet.lighttextColor,
                ),
              ),
              const Spacer(),
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
            ],
          ),

          const SizedBox(height: 6),

          // Row 2: Main Task Name
          Text(
            "Task Part",
            style:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorsSet.textColor,
            ),
          ),

          const SizedBox(height: 8),

          // Row 3: Time Indicator & Dynamic Status Tag
          Row(
            children: [
              Icon(
                Icons.access_time_filled,
                size: 16,
                color: ColorsSet.hourColor,
              ),
              const SizedBox(width: 4),
              Text(
                "$_now:$minute_now PM",
                style: TextStyle(
                  fontSize: 14,
                  color: ColorsSet.hourColor,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: ColorsSet.lightTodoColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'To do',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorsSet.TodoColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
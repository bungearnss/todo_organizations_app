import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/tasks.dart';
import '../../utility/constant.dart';

class TodayTaskListItem extends StatelessWidget {
  final String taskTitle;
  final int taskType;
  final DateTime? date;
  final bool completeStatus;

  TodayTaskListItem({
    required this.taskTitle,
    required this.taskType,
    this.date,
    required this.completeStatus,
  });

  String timeFormatter(DateTime time) {
    final converTime = DateFormat('HH:mm').format(time);
    return converTime;
  }

  String dateFormatter(DateTime date) {
    final convertDate = DateFormat('MMM d').format(date);
    return convertDate;
  }

  Color meetingTypeColor(String location) {
    Color bgColor;
    switch (location) {
      case "Microsoft Team":
        bgColor = const Color.fromARGB(255, 0, 102, 255);
        break;
      case "Office":
        bgColor = const Color.fromARGB(255, 255, 158, 40);
        break;
      case "Google Meeting":
        bgColor = const Color.fromARGB(255, 66, 180, 69);
        break;
      default:
        bgColor = const Color.fromARGB(255, 89, 146, 245);
    }
    return bgColor;
  }

  Widget typeFormatter(int type) {
    String title = "";
    Color? color;
    switch (type) {
      case 1:
        title = "Learning";
        color = learningColor;
        break;
      case 2:
        title = "Working";
        color = workingColor;
        break;
      case 3:
        title = "Activity";
        color = activityColor;
        break;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              fontWeight: FontWeight.normal),
        ),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey[300]!,
          ),
        ),
      ),
      child: ListTile(
        leading: renderLeading(),
        title: Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              typeFormatter(taskType),
              Text(
                taskTitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderLeading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(dateFormatter(date!),
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
        Text(timeFormatter(date!),
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
      ],
    );
  }
}

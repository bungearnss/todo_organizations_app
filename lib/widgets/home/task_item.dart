import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../utility/constant.dart';

class TaskItem extends StatelessWidget {
  String taskTitle;
  int taskType;
  double? percent;
  bool status;

  TaskItem({
    required this.taskTitle,
    required this.taskType,
    this.percent,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
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
      return Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 7.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color,
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontSize: 12, color: Colors.white),
        ),
      );
    }

    return SizedBox(
      width: 150,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        elevation: 0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              typeFormatter(taskType),
              Text(
                taskTitle,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 13,
                      color: Colors.black,
                    ),
              ),
              Text(
                status == true ? "complete" : "Incomplete",
                style: const TextStyle(fontSize: 11),
                textAlign: TextAlign.end,
              ),
              percent != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${(percent! * 100).toStringAsFixed(1)}%",
                            style: const TextStyle(fontSize: 11),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: LinearPercentIndicator(
                              animation: true,
                              animationDuration: 800,
                              lineHeight: 3.0,
                              percent: percent!,
                              progressColor: Colors.green,
                              backgroundColor: Colors.grey[200],
                              linearStrokeCap: LinearStrokeCap.roundAll,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

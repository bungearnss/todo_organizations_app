import 'package:flutter/material.dart';
import 'package:todo_app/widgets/home/circle_progress_item.dart';

import '../../utility/constant.dart';

class NotificationItem extends StatelessWidget {
  int notiType;
  String title;
  String subtitle;
  DateTime startTime;
  DateTime? endTime;
  String? organizer;

  NotificationItem({
    required this.notiType,
    required this.title,
    required this.subtitle,
    required this.startTime,
    this.endTime,
    this.organizer,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey[300]!,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                notiTypeFormatter(notiType),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, bottom: 5),
                  child: Text(
                    subtitle,
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.8,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.8,
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.timer_sharp,
                            color: Colors.grey,
                            size: 13,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: endTime == null
                                ? Text(
                                    startTime.toString().substring(10, 16),
                                    style: const TextStyle(fontSize: 12),
                                  )
                                : Text(
                                    '${startTime.toString().substring(10, 16)} -${endTime.toString().substring(10, 16)}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                organizer == null
                    ? Container()
                    : CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(organizer!),
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget notiTypeFormatter(int type) {
    String title = "";
    Color? color;
    switch (type) {
      case 1:
        title = "Work";
        color = pinkLight;
        break;
      case 2:
        title = "Personal";
        color = googleColor;
        break;
      case 3:
        title = "Office";
        color = officeColor;
        break;
      case 4:
        title = "Home";
        color = purpleLight;
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(
        vertical: 3.0,
        horizontal: 7.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}

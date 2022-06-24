import 'package:flutter/material.dart';

import '../widgets/gradient_appbar.dart';
import '../utility/mockdata.dart';
import '../utility/constant.dart';
import '../widgets/home/circle_progress_item.dart';
import '../widgets/home/meeting_card_item.dart';
import '../widgets/home/task_item.dart';

import 'home/all_task.dart';
import 'home/all_meeting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: gradientAppbar(context),
      body: Container(
        height: height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Work in Progress",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18, color: Colors.black),
                ),
                SizedBox(
                  width: width,
                  height: height * 0.18,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: progressList.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: CircleProgress(
                          color: progressList[index].color,
                          percent: progressList[index].percent,
                          title: progressList[index].title,
                          radius: 32.0,
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Meeting",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AllMeeting()),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "See All",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      color: Colors.blueAccent[400],
                                      fontSize: 14,
                                    ),
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.blueAccent[400],
                            size: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: width,
                  height: height * 0.22,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: meetingInfoList.length,
                    itemBuilder: (ctx, index) {
                      return MeetingCardItem(
                        location: meetingInfoList[index].location,
                        meetTitle: meetingInfoList[index].meetTitle,
                        organizer: meetingInfoList[index].organizer,
                        meetIcon: meetingInfoList[index].meetIcon,
                        date: meetingInfoList[index].date,
                        time: meetingInfoList[index].time,
                        numOfparticipant:
                            meetingInfoList[index].numOfparticipant,
                        participant: meetingInfoList[index].part,
                        description: "Special Event",
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Today's Tasks",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllTodayTask()),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "See All",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      color: Colors.blueAccent[400],
                                      fontSize: 14,
                                    ),
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.blueAccent[400],
                            size: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: width,
                  height: height * 0.155,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (ctx, index) {
                      return TaskItem(
                        taskTitle: myTasks[index].taskTitle,
                        taskType: myTasks[index].taskType,
                        percent: myTasks[index].percent,
                        status: myTasks[index].status,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

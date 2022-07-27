import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utility/mockdata.dart';
import '../utility/constant.dart';
import '../widgets/home/circle_progress_item.dart';
import '../widgets/home/meeting_card_item.dart';
import '../widgets/home/task_item.dart';
import '../widgets/home/project_item.dart';

import 'home/all_task.dart';
import 'home/all_meeting.dart';

import '../screens/notifications_screen.dart';

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
                      .copyWith(fontSize: 14, color: Colors.black),
                ),
                SizedBox(
                  width: width,
                  height: height * 0.16,
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
                SizedBox(
                  height: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " Meeting",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 14, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllMeeting()),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "See All",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: Colors.blueAccent[400],
                                    fontSize: 12,
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
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " Today's Tasks",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 14, color: Colors.black),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: Colors.blueAccent[400],
                                    fontSize: 12,
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
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " New Projects",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 14, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllTodayTask()),
                          ); */
                        },
                        child: Row(
                          children: [
                            Text(
                              "See All",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: Colors.blueAccent[400],
                                    fontSize: 12,
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
                ),
                SizedBox(
                  // width: width,
                  height: height * 0.17,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (ctx, index) {
                      final projItem = projInfo[index];
                      return ProjectItem(
                        projType: projItem.projType,
                        projTitle: projItem.projTitle,
                        percent: projItem.percent,
                        organizer: projItem.organizer,
                        orgImg: projItem.orgImg,
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

  PreferredSize? gradientAppbar(BuildContext context) {
    final dateNow = DateTime.now();
    String dateFormatter = DateFormat.yMMMMEEEEd().format(dateNow);
    return PreferredSize(
      preferredSize: const Size.fromHeight(120.0),
      child: AppBar(
        leading: const IconButton(
          icon: Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: GestureDetector(
              child: const Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsScreen(),
                  ),
                );
              },
            ),
          ),
        ],
        elevation: 0,
        flexibleSpace: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(120, 105, 250, 1),
                      Color.fromRGBO(87, 80, 252, 1)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15.0,
              left: 15.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(userprofile.profilepic),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello ${userprofile.name}!",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Your tasks on $dateFormatter",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

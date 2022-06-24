import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../utility/constant.dart';
import '../utility/mockdata.dart';
import '../widgets/home/circle_progress_item.dart';
import '../models/progress.dart';
import '../widgets/dashboard/statistic_graph.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

final mock = [
  Progress(percent: 0.43, title: "Learning", color: learningColor),
  Progress(percent: 0.86, title: "Working", color: workingColor),
  Progress(percent: 0.28, title: "Activity", color: activityColor),
];

class _DashBoardScreenState extends State<DashBoardScreen> {
  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _showAppbar ? appBar(context) : null,
      body: SingleChildScrollView(
        controller: _scrollViewController,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(userprofile.profilepic),
                    ),
                  ),
                  Positioned(
                    right: width * 0.4,
                    top: 72,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.greenAccent[400],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      userprofile.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.black, fontSize: 22),
                    ),
                    Text(
                      "@${userprofile.username} : ${userprofile.position}",
                      style: const TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      width: width,
                      height: height * 0.16,
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: mock.length,
                          itemBuilder: (ctx, index) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: CircleProgress(
                                color: mock[index].color,
                                percent: mock[index].percent,
                                title: mock[index].title,
                                radius: 30,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Your Statistic",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16, color: Colors.black),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: SizedBox(
                  child: StatisticGraph(type: "line"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: SizedBox(
                  child: StatisticGraph(type: "statistic"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize? appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(top: 10, right: 10),
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz_outlined,
              color: Color.fromARGB(255, 59, 59, 59),
              size: 23,
            ),
          ),
        ],
      ),
    );
  }
}

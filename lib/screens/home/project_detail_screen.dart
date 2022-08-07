import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../models/projects.dart';
import '../../models/checklists.dart';
import '../../utility/constant.dart';

import '../../widgets/home/checklist_item.dart';

class ProjectDetailScreen extends StatefulWidget {
  Projects projectInfo;

  ProjectDetailScreen({required this.projectInfo});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  Widget setPriority(int prty) {
    String strPrty = "";
    Color? color;
    switch (prty) {
      case 1:
        strPrty = "High";
        color = workingColor;
        break;
      case 2:
        strPrty = "Medium";
        color = googleColor;
        break;
      case 3:
        strPrty = "Low";
        color = learningColor;
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Text(
        strPrty,
        style: const TextStyle(
            color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.projectInfo;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.assignment_late_rounded,
                    color: themeColor,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    item.projType,
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  item.projTitle,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 13,
                    backgroundImage: NetworkImage(item.orgImg),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Created by",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    item.organizer,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[300],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.calendar_month_rounded,
                            size: 17,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Due Date",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            item.duedate.toString(),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: msColor,
                      ),
                      child: Text(
                        item.status,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "Priority",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 5),
                  setPriority(item.priority),
                ],
              ),
              const SizedBox(height: 10),
              ExpandableText(
                item.projDetail,
                expandText: 'show more',
                collapseText: 'show less',
                linkColor: Colors.blue,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 5,
                animation: true,
                expandOnTextTap: true,
              ),
              const SizedBox(height: 20),
              const Text(
                "Checklist",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                margin: EdgeInsets.only(
                    top: 10, bottom: 10, left: item.percent * 2.8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[300],
                ),
                child: Text(
                  "${(item.percent).toStringAsFixed(1)}%",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              LinearPercentIndicator(
                animation: true,
                animationDuration: 800,
                lineHeight: 3.0,
                percent: (item.percent / 100),
                progressColor: themeColor,
                backgroundColor: Colors.grey[200],
                linearStrokeCap: LinearStrokeCap.roundAll,
              ),
              ExpansionTile(
                childrenPadding: const EdgeInsets.symmetric(vertical: 0),
                title: Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: const Text(
                    "Operation Steps",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CheckListItem(
                    id: item.projChecklist[0].id,
                    title: item.projChecklist[0].topicTitle,
                    finished: item.projChecklist[0].finished,
                  ),
                ),
                children: [
                  Container(
                    width: width,
                    constraints:
                        const BoxConstraints(minHeight: 100, maxHeight: 300),
                    padding: const EdgeInsets.only(left: 15),
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: item.projChecklist.length - 1,
                      itemBuilder: (ctx, index) {
                        final newItem = item.projChecklist
                            .where((((item) => item.id > 1)))
                            .toList();
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CheckListItem(
                            title: newItem[index].topicTitle,
                            finished: newItem[index].finished,
                            id: newItem[index].id,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "Team members",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Container(
                width: width * 0.65,
                height: 55,
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(item.teams[0].imgProfile),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(item.teams[1].imgProfile),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(item.teams[2].imgProfile),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue[50],
                      radius: 25,
                      child: Text(
                        "+${item.numOfparticipant - 3}",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: Colors.blue,
                              fontSize: 13,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "File Shared",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Container(
                width: width,
                height: 90,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: item.filePath.length,
                  itemBuilder: (ctx, index) {
                    return SizedBox(
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              item.filePath[index].fileType,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              item.filePath[index].title,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.chevron_left_outlined,
                color: Color.fromARGB(255, 59, 59, 59),
                size: 23,
              ),
            ),
          ),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.more_horiz_outlined,
                color: Color.fromARGB(255, 59, 59, 59),
                size: 23,
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utility/constant.dart';
import '../../models/projects.dart';
import '../../screens/home/project_detail_screen.dart';

class ProjectItem extends StatelessWidget {
  Projects projectInfo;

  ProjectItem({
    required this.projectInfo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetailScreen(projectInfo: projectInfo),
          ),
        );
      },
      child: SizedBox(
        width: 150,
        child: Card(
          elevation: 0.8,
          shadowColor: const Color.fromARGB(255, 172, 172, 172),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  projectInfo.projType,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  projectInfo.projTitle,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${(projectInfo.percent).toStringAsFixed(1)}%",
                        style: const TextStyle(fontSize: 11),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: LinearPercentIndicator(
                          animation: true,
                          animationDuration: 800,
                          lineHeight: 3.0,
                          percent: (projectInfo.percent / 100),
                          progressColor: Colors.green,
                          backgroundColor: Colors.grey[200],
                          linearStrokeCap: LinearStrokeCap.roundAll,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(projectInfo.orgImg),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Created by",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              child: Text(
                                projectInfo.organizer,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

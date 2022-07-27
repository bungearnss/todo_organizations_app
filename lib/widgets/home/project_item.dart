import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utility/constant.dart';
import '../../models/projects.dart';

class ProjectItem extends StatelessWidget {
  String projType;
  String projTitle;
  double percent;
  String organizer;
  String orgImg;

  ProjectItem({
    required this.projType,
    required this.projTitle,
    required this.percent,
    required this.organizer,
    required this.orgImg,
  });

  @override
  Widget build(BuildContext context) {
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
              Text(
                projType,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                projTitle,
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
                      "${(percent).toStringAsFixed(1)}%",
                      style: const TextStyle(fontSize: 11),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: LinearPercentIndicator(
                        animation: true,
                        animationDuration: 800,
                        lineHeight: 3.0,
                        percent: (percent / 100),
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
                      backgroundImage: NetworkImage(orgImg),
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
                          Text(
                            organizer,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
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
    );
  }
}

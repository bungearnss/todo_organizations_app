import 'package:flutter/material.dart';
import '../../models/participant.dart';

import '../../utility/constant.dart';

class MeetingCardItem extends StatelessWidget {
  String location;
  String meetTitle;
  String? description;
  String organizer;
  String meetIcon;
  String date;
  String time;
  int numOfparticipant;
  List<Participant> participant;

  MeetingCardItem({
    required this.location,
    required this.meetTitle,
    this.description,
    required this.organizer,
    required this.meetIcon,
    required this.date,
    required this.time,
    required this.numOfparticipant,
    required this.participant,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Color meetingTypeColor(String location) {
      Color bgColor;
      switch (location) {
        case "Microsoft Team":
          bgColor = msColor;
          break;
        case "Office":
          bgColor = officeColor;
          break;
        case "Google Meeting":
          bgColor = googleColor;
          break;
        default:
          bgColor = const Color.fromARGB(255, 89, 146, 245);
      }
      return bgColor;
    }

    final part = (numOfparticipant - 3).toString();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      elevation: 0.8,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Positioned(
            top: 10,
            right: 15,
            child: ClipOval(
              child: Container(
                width: 45,
                height: 45,
                padding: const EdgeInsets.all(8),
                color: const Color.fromARGB(255, 238, 236, 236),
                child: Image.network(
                  meetIcon,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 7.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: meetingTypeColor(location),
                  ),
                  child: Text(
                    location,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12, color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    meetTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black, fontSize: 15),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6.0),
                  padding: const EdgeInsets.only(bottom: 15.0),
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.3,
                        color: Colors.grey[100]!,
                      ),
                    ),
                  ),
                  child: Text(
                    // "  Created by $organizer",
                    description == null
                        ? "Created by $organizer"
                        : "$description Created by $organizer",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 13),
                  ),
                ),
                Container(
                  width: width * 0.8,
                  height: 40,
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned(
                              right: 75,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    NetworkImage(participant[0].imgProfile),
                              ),
                            ),
                            Positioned(
                              right: 57,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    NetworkImage(participant[1].imgProfile),
                              ),
                            ),
                            Positioned(
                              right: 39,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    NetworkImage(participant[2].imgProfile),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.blue[50],
                                radius: 15,
                                child: Text(
                                  "+$part",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        color: Colors.blue,
                                        fontSize: 14,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey[400],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    date,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            color: Colors.black, fontSize: 14),
                                  ),
                                  Text(
                                    time,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontSize: 13),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../utility/constant.dart';

class MeetingItem extends StatelessWidget {
  final String meetTitle;
  final String date;
  final String organizer;
  final String time;
  final String location;

  MeetingItem({
    required this.meetTitle,
    required this.date,
    required this.organizer,
    required this.time,
    required this.location,
  });

  Widget locationColor(String location) {
    Color? color;
    switch (location) {
      case "Microsoft Team":
        color = msColor;
        break;
      case "Google Meeting":
        color = googleColor;
        break;
      case "Office":
        color = officeColor;
        break;
    }
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15.0, top: 20),
            child: Text(
              date,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Text(
              time.substring(0, 5),
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
            title: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        locationColor(location),
                        const SizedBox(width: 8),
                        Text(
                          meetTitle,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0, top: 3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.co_present_rounded,
                          size: 14,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Created by $organizer",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

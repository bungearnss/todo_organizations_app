import 'package:flutter/material.dart';

import '../../utility/constant.dart';

class MeetingImageSlider extends StatelessWidget {
  final String title;
  final String profileImg;
  final String organizer;
  final String location;
  final String date;
  final String imgUrl;

  MeetingImageSlider({
    required this.title,
    required this.profileImg,
    required this.organizer,
    required this.location,
    required this.date,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(image: NetworkImage(imgUrl)),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                end: const Alignment(0.0, 0.4),
                begin: const Alignment(0.0, -1),
                colors: <Color>[
                  const Color.fromARGB(214, 0, 0, 0),
                  Colors.black12.withOpacity(0.0)
                ],
              ),
            ),
          ),
        ),
        //bottom grey shadow
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                end: const Alignment(0.0, -1),
                begin: const Alignment(0.0, 0.4),
                colors: <Color>[
                  const Color.fromARGB(214, 0, 0, 0),
                  Colors.black12.withOpacity(0.0)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                location,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(profileImg),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Created by $organizer",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ]),
          ),
        ),
        Positioned(
          right: 8,
          top: 10,
          child: Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: pinkLight,
            ),
            child: Text(
              date,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}

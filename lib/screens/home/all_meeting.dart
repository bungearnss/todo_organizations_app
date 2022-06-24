import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utility/mockdata.dart';
import '../../utility/constant.dart';
import '../../widgets/home/meeting_imageslider.dart';
import '../../widgets/home/meeting_item.dart';

class AllMeeting extends StatefulWidget {
  const AllMeeting({Key? key}) : super(key: key);

  @override
  State<AllMeeting> createState() => _AllMeetingState();
}

class _AllMeetingState extends State<AllMeeting> {
  late PageController _pageController;
  String? displayDate;

  List<String> images = [
    "https://img-cdn.inc.com/image/upload/w_1920,h_1080,c_fill/images/panoramic/GettyImages-1171809410_474475_urfhop.jpg",
    "https://images.unsplash.com/photo-1497032628192-86f99bcd76bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8d29ya3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1CIW6h2Ijs_W9UPyJUKIhjfM_GDqYo1mq6zQc_OI5q6k7BNajw6dg7scZzvAl3nPOb9w&usqp=CAU"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  dateFormatter(DateTime date) {
    final convertDate = DateFormat('EEE, MMM yy').format(date);
    return convertDate;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final today = dateFormatter(DateTime.now());
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Hello ${userprofile.username}!",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 2, bottom: 8, left: 15.0, right: 15),
                      child: Text(
                        "Your Meeting on $today",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 2,
                        bottom: 8,
                        left: 15.0,
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(userprofile.profilepic),
                        radius: 25,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 2, bottom: 8, left: 5.0, right: 15),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey[300],
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 24,
                          child: Icon(
                            Icons.calendar_month_sharp,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              width: width,
              height: 180,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Colors.grey[300]!,
                  ),
                ),
              ),
              child: PageView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemCount: meetingInfoList.length,
                  pageSnapping: true,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: MeetingImageSlider(
                        imgUrl: images[index],
                        title: meetingInfoList[index].meetTitle,
                        profileImg: meetingInfoList[index].meetIcon,
                        organizer: meetingInfoList[index].organizer,
                        location: meetingInfoList[index].location,
                        date: meetingInfoList[index].date,
                      ),
                    );
                  }),
            ),
            Container(
              color: Colors.white,
              height: height,
              child: ListView.builder(
                  itemCount: meetingInfoList.length,
                  itemBuilder: (context, index) {
                    final item = meetingInfoList[index];
                    return MeetingItem(
                      meetTitle: item.meetTitle,
                      date: item.date,
                      organizer: item.organizer,
                      time: item.time,
                      location: item.location,
                    );
                  }),
            )
          ],
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
      ),
    );
  }
}

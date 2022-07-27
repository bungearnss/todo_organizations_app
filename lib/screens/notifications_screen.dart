import 'package:flutter/material.dart';

import '../utility/mockdata.dart';

import '../widgets/notification/notification_item.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final notiNum = notiInfo.length;

    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height,
              color: Colors.white,
              child: ListView.builder(
                  itemCount: notiNum,
                  itemBuilder: (context, index) {
                    final item = notiInfo[index];
                    return NotificationItem(
                      notiType: item.notiType,
                      title: item.title,
                      subtitle: item.subtitle,
                      startTime: item.startTime,
                      endTime: item.endTime,
                      organizer: item.organizer,
                    );
                  }),
            ),
          ],
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
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.auto_fix_off,
              color: Color.fromARGB(255, 82, 82, 82),
              size: 22,
            ),
          ),
        ],
        title: const Text(
          "Notifications",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),
    );
  }
}

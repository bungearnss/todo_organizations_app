import 'package:flutter/material.dart';
import 'package:todo_app/utility/mockdata.dart';
import './calendar/flutter_clean_calendar.dart';

import '../utility/constant.dart';
import '../utility/mockdata.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final Map<DateTime, List<CleanCalendarEvent>> _events = {
    // DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 3):
    //     [
    //   CleanCalendarEvent(
    //     'Event B',
    //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 10, 0),
    //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 12, 0),
    //     color: Colors.orange,
    //     part: meetingInfoList[0].part,
    //   ),
    //   CleanCalendarEvent(
    //     'Event C',
    //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 14, 30),
    //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 17, 0),
    //     color: Colors.pink,
    //     part: meetingInfoList[1].part,
    //   ),
    //   CleanCalendarEvent(
    //     'Event D',
    //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 14, 30),
    //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 17, 0),
    //     color: Colors.amber,
    //     part: meetingInfoList[2].part,
    //   ),
    //   CleanCalendarEvent(
    //     'Event E',
    //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 14, 30),
    //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 17, 0),
    //     color: Colors.deepOrange,
    //     part: meetingInfoList[1].part,
    //   ),
    //   CleanCalendarEvent(
    //     'Event F',
    //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 14, 30),
    //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 17, 0),
    //     color: Colors.green,
    //     part: meetingInfoList[1].part,
    //   ),
    //   CleanCalendarEvent(
    //     'Event G',
    //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 14, 30),
    //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 17, 0),
    //     color: Colors.indigo,
    //     part: meetingInfoList[0].part,
    //   ),
    //   CleanCalendarEvent(
    //     'Event H',
    //     startTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 14, 30),
    //     endTime: DateTime(DateTime.now().year, DateTime.now().month,
    //         DateTime.now().day + 2, 17, 0),
    //     color: Colors.brown,
    //     part: meetingInfoList[2].part,
    //   ),
    // ],
  };

  void _handleNewDate(date) {
    print('Date selected: $date');
  }

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
    );

    print(
        "NOWWWWW :::: ${DateTime.now().year},${DateTime.now().month},${DateTime.now().day}");
  }

  PreferredSize? appbar(Function onPressed) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 59, 59, 59),
                      size: 23,
                    ),
                    onPressed: () => onPressed,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 59, 59, 59),
                      size: 25,
                    ),
                    onPressed: () => onPressed,
                  ),
                ),
              ],
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(() {}),
      backgroundColor: bgColor,
      body: Container(
        child: Calendar(
          hideBottomBar: true,
          hideTodayIcon: true,
          weekDays: const ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
          startOnMonday: true,
          isExpanded: true,
          events: calendaEvents,
          onDateSelected: (date) => _handleNewDate(date),
          eventDoneColor: Colors.green,
          selectedColor: themeColor,
          todayColor: Colors.black,
          eventColor: Colors.red,
          // todayButtonText: 'Heute',
          // expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          dayOfWeekStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

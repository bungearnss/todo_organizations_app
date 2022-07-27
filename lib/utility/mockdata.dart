import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/user.dart';
import '../models/progress.dart';
import '../models/meeting.dart';
import '../models/participant.dart';
import '../models/tasks.dart';
import '../screens/calendar/clean_calendar_event.dart';
import '../models/notifications.dart';

timeFormatter(DateTime time) {
  final converTime = DateFormat('HH:mm').format(time);
  return converTime;
}

dateFormatter(DateTime date) {
  final convertDate = DateFormat('MMM d, yyyy').format(date);
  return convertDate;
}

final userprofile = User(
  username: "bungearnss",
  profilepic:
      "https://images.pexels.com/photos/3792581/pexels-photo-3792581.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  name: "Tunsuda Boonloed",
  position: "Frontend Developer",
);

final List<Progress> progressList = [
  Progress(percent: 0.43, title: "Java", color: Colors.purple[200]!),
  Progress(percent: 0.85, title: "Design", color: Colors.green[200]!),
  Progress(percent: 0.28, title: "Amazon Services", color: Colors.pink[200]!),
  Progress(percent: 0.65, title: "Workflow", color: Colors.orange[200]!),
];

final List<Meeting> meetingInfoList = [
  Meeting(
    location: "Microsoft Team",
    meetTitle: "Meeting with Organization Team",
    organizer: "Adum",
    meetIcon: "https://cdn-icons-png.flaticon.com/512/906/906349.png",
    date:
        "${dateFormatter(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))}",
    time:
        "${timeFormatter(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0))} - ${timeFormatter(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0))}",
    numOfparticipant: 12,
    part: [
      Participant(
          imgProfile:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3Hb0oBn2PpbuLxYU-pkuJT-lHNwv92xFknBz_uKs79I7NLp9UYzTGjrfXkCbMgpbXS-8&usqp=CAU"),
      Participant(
          imgProfile: "https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg"),
      Participant(
          imgProfile:
              "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
    ],
  ),
  Meeting(
    location: "Google Meeting",
    meetTitle: "Meeting with Design Team",
    organizer: "Irister",
    meetIcon:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Google_Meet_icon_%282020%29.svg/2491px-Google_Meet_icon_%282020%29.svg.png",
    date:
        "${dateFormatter(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2))}",
    time:
        "${timeFormatter(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 10, 0))} - ${timeFormatter(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 12, 0))}",
    numOfparticipant: 20,
    part: [
      Participant(
          imgProfile:
              "https://img.freepik.com/free-photo/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-him-smiling_343059-4560.jpg?w=2000"),
      Participant(
          imgProfile:
              "https://i.pinimg.com/originals/23/86/b3/2386b3507ad48cf343a9e01c6b233b58.jpg"),
      Participant(
          imgProfile:
              "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?cs=srgb&dl=pexels-suliman-sallehi-1704488.jpg&fm=jpg"),
    ],
  ),
  Meeting(
    location: "Office",
    meetTitle: "Meeting with Operation Team",
    organizer: "Adison P.",
    meetIcon:
        "https://www.freeiconspng.com/thumbs/office-icon/office-icon--insharepics-11.png",
    date:
        "${dateFormatter(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2))}",
    time:
        "${timeFormatter(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 14, 30))} - ${timeFormatter(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 17, 0))}",
    numOfparticipant: 7,
    part: [
      Participant(
          imgProfile:
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
      Participant(
          imgProfile:
              "https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?w=2000"),
      Participant(
          imgProfile:
              "https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?cs=srgb&dl=pexels-masha-raymers-2726111.jpg&fm=jpg"),
    ],
  ),
];

/* 
Task type
1 = Learning
2 = Working
3 = Activity

status
false = incomplete
true = completed
*/

final List<Task> myTasks = [
  Task(
    id: '1',
    taskTitle: "Java Learning",
    taskType: 1,
    percent: 0.45,
    status: false,
    date: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 2, 14, 30),
  ),
  Task(
    id: '2',
    taskTitle: "Running",
    taskType: 3,
    status: false,
    date: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 2, 17, 00),
  ),
  Task(
    id: '3',
    taskTitle: "Shopping",
    taskType: 3,
    status: true,
    date: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 3, 9, 00),
  ),
  Task(
    id: '4',
    taskTitle: "Go to customer site",
    taskType: 2,
    status: true,
    date: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 3, 13, 00),
  ),
  Task(
    id: '5',
    taskTitle: "React Learning",
    taskType: 1,
    percent: 0.6,
    status: false,
    date: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 4, 8, 00),
  ),
];

final Map<DateTime, List<CleanCalendarEvent>> calendaEvents = {
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
    CleanCalendarEvent(
      meetingInfoList[0].meetTitle,
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
      description: 'A special event',
      color: Colors.blue[700]!,
      part: meetingInfoList[0].part,
      location: meetingInfoList[0].location,
      numOfparticipant: meetingInfoList[0].numOfparticipant,
    ),
  ],
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2): [
    CleanCalendarEvent(meetingInfoList[1].meetTitle,
        location: meetingInfoList[1].location,
        description: "Daily Catch up",
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 12, 0),
        color: Colors.orange,
        part: meetingInfoList[1].part,
        numOfparticipant: meetingInfoList[1].numOfparticipant),
    CleanCalendarEvent(
      meetingInfoList[2].meetTitle,
      location: meetingInfoList[2].location,
      description: "Recap progress",
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 2, 14, 30),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 2, 17, 0),
      color: Colors.pink,
      part: meetingInfoList[2].part,
      numOfparticipant: meetingInfoList[2].numOfparticipant,
    ),
  ],
};

/* 
noti type
1 = work
2 = personal
3 = Office
4 = Home
*/

final List<Notifications> notiInfo = [
  Notifications(
    notiType: 1,
    title: "Justin send you feedback about color and workflow",
    subtitle: "Manage Material & Design App",
    startTime: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
    endTime: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 00),
    organizer:
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg",
  ),
  Notifications(
    notiType: 2,
    title: "Checkout your list before it's gone",
    subtitle: "Gerneral List",
    startTime: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 15, 0),
    endTime: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 16, 0),
  ),
  Notifications(
    notiType: 3,
    title: "Ketty comment on youre Home Scrren and need you to discussion",
    subtitle: "Graphics",
    startTime: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, 13, 0),
    endTime: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, 15, 0),
    organizer:
        "https://sociology.indiana.edu/about/faculty/BernicePescosolido_ER_7334_cropped.jpg",
  ),
  Notifications(
    notiType: 4,
    title: "Schedule an appointment for vaccinations at the Bangkok Hospital",
    subtitle: "Hospital Appointment",
    startTime: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 2, 9, 0),
  ),
];

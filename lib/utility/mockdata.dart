import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/user.dart';
import '../models/progress.dart';
import '../models/meeting.dart';
import '../models/participant.dart';
import '../models/tasks.dart';
import '../screens/calendar/clean_calendar_event.dart';
import '../models/notifications.dart';
import '../models/projects.dart';
import '../models/checklists.dart';
import '../models/files.dart';

timeFormatter(DateTime time) {
  final converTime = DateFormat('HH:mm').format(time);
  return converTime;
}

dateFormatter(DateTime date) {
  final convertDate = DateFormat('MMM d, yyyy').format(date);
  return convertDate;
}

convertFileType(String type) {
  late String fileUrl;
  switch (type) {
    case ".DOCX":
      fileUrl =
          "https://findicons.com/files/icons/2795/office_2013_hd/2000/word.png";
      break;
    case ".XLSX":
      fileUrl =
          "https://findicons.com/files/icons/2795/office_2013_hd/2000/excel.png";
      break;
    case ".PPT":
      fileUrl =
          "https://findicons.com/files/icons/2795/office_2013_hd/2000/powerpoint.png";
      break;
    case ".TXT":
      fileUrl = "https://cdn-icons-png.flaticon.com/512/104/104647.png?w=360";
      break;
    case ".PDF":
      fileUrl =
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/PDF_file_icon.svg/1200px-PDF_file_icon.svg.png";
      break;
  }
  return fileUrl;
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

final List<Projects> projInfo = [
  Projects(
    projType: "Mobile App",
    projTitle: "PaoTung",
    percent: 24.5,
    organizer: "Abdill Murat",
    orgImg:
        "https://i.guim.co.uk/img/media/48cb9586d9dd5c15b1ff15873e066d2977cb4482/66_0_1916_1150/master/1916.jpg?width=1200&quality=85&auto=format&fit=max&s=a9828149a206b076be6df36a8ce2e436",
    duedate: dateFormatter(DateTime(
        DateTime.now().year + 1, DateTime.now().month, DateTime.now().day)),
    projDetail:
        "The Mobile App Project for XYZ Company includes six main services ABC Software Company is offering for the app development. The main services are market research and data analysis, OS & Android app development, software development, content writing, quality assurance testing and yearly mottje app maintenance. The project will be completed within 1 year after the contract signed",
    status: "In progress",
    numOfparticipant: 20,
    teams: [
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
    projChecklist: [
      CheckList(
          id: 1, topicTitle: "Research and data analysis", finished: true),
      CheckList(
          id: 2,
          topicTitle: "Creating the first mockup and approval",
          finished: true),
      CheckList(
          id: 3,
          topicTitle: "Proceed with building the app using wireframes",
          finished: false),
      CheckList(
          id: 4,
          topicTitle: "Create the front-end technology of the app",
          finished: false),
      CheckList(id: 5, topicTitle: "Improve visual UI desing", finished: false),
      CheckList(
          id: 6,
          topicTitle: "Produce the backend technology of the app",
          finished: false),
      CheckList(id: 7, topicTitle: "Perform UX QA Testing", finished: false),
      CheckList(
          id: 8,
          topicTitle: "Perform futher testing with the client",
          finished: false),
      CheckList(
          id: 9,
          topicTitle: "Launch the app in App Store and Play Store",
          finished: false),
    ],
    priority: 1,
    filePath: [
      Files(title: "User Requirements", fileType: convertFileType(".DOCX")),
      Files(title: "Project Assignemnt", fileType: convertFileType(".XLSX")),
      Files(title: "User guidline", fileType: convertFileType(".PPT")),
      Files(title: "Weekly Record Agenda", fileType: convertFileType(".TXT")),
      Files(title: "User manual", fileType: convertFileType(".PDF")),
    ],
  ),
  Projects(
    projType: "UX & UI Design",
    projTitle: "Lotassss",
    percent: 78,
    organizer: "Abbas Luang",
    orgImg:
        "https://www.theportlandclinic.com/wp-content/uploads/2019/07/Person-Curtis_4x5-e1564616444404-300x300.jpg",
    duedate: dateFormatter(DateTime(
        DateTime.now().year, DateTime.now().month + 3, DateTime.now().day)),
    projDetail:
        "First we'll dig deep and perform research to understand your users and their needs more clearly. We'll analyze the data and present our findings. Then we'll design wireframes and prototypes we can test to be sure the new design works as expected and there are no usability issues."
        "We'll be able to measure the effectiveness of the re-design when a) the prototypes pass user-tests with little to no usability issues and b) later on when the designs are implemented we expect to see a 10% increase in trial to paid conversion.",
    status: "In progress",
    numOfparticipant: 12,
    teams: [
      Participant(
          imgProfile:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3Hb0oBn2PpbuLxYU-pkuJT-lHNwv92xFknBz_uKs79I7NLp9UYzTGjrfXkCbMgpbXS-8&usqp=CAU"),
      Participant(
          imgProfile: "https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg"),
      Participant(
          imgProfile:
              "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
    ],
    projChecklist: [
      CheckList(id: 1, topicTitle: "Kick-off discovery", finished: true),
      CheckList(
          id: 2, topicTitle: "User/Stakeholder interviews", finished: true),
      CheckList(id: 3, topicTitle: "Research analysis", finished: true),
      CheckList(id: 4, topicTitle: "Present finfings", finished: true),
      CheckList(id: 5, topicTitle: "Present wireframes", finished: true),
      CheckList(
          id: 6, topicTitle: "Present high-fidelity prototype", finished: true),
      CheckList(id: 7, topicTitle: "Perform user testing", finished: false),
      CheckList(
          id: 8, topicTitle: "Make changes to prototype", finished: false),
    ],
    priority: 2,
    filePath: [
      Files(title: "User Requirements", fileType: convertFileType(".DOCX")),
      Files(title: "Project Assignemnt", fileType: convertFileType(".XLSX")),
      Files(title: "User guidline", fileType: convertFileType(".PPT")),
      Files(title: "Weekly Record Agenda", fileType: convertFileType(".TXT")),
      Files(title: "User manual", fileType: convertFileType(".PDF")),
    ],
  ),
  Projects(
    projType: "Web Development",
    projTitle: "MuangThai",
    percent: 65,
    organizer: "Murad Fong",
    orgImg:
        "https://www.genesishealth.com/app/files/public/barclaymarty_gopeds.jpg",
    duedate: dateFormatter(DateTime(
        DateTime.now().year, DateTime.now().month + 6, DateTime.now().day)),
    projDetail:
        "build your website using the content management system (CMS). This CMS is used by more than a million brands around the world, and is known for it's ease of use, security, and scalability. CMS will allow you to do the following once your website is launched:"
        "- Easily update page content and images"
        "- Integrate with analytics software to track page and site performance"
        "- Post new content to your company blog"
        ""
        "We propose that your site be hosted with using modern technologies. This will ensure that your website is capable of supporting a high volume of traffic while remaining protected from malicious entities.",
    status: "In progress",
    numOfparticipant: 24,
    teams: [
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
    projChecklist: [
      CheckList(id: 1, topicTitle: "Project Kickoff Meeting", finished: true),
      CheckList(id: 2, topicTitle: "Initial Design Wireframe", finished: true),
      CheckList(id: 3, topicTitle: "Page Mockups", finished: false),
      CheckList(id: 4, topicTitle: "Site Copy & Images", finished: false),
      CheckList(id: 5, topicTitle: "Functional Prototype", finished: false),
      CheckList(
          id: 6, topicTitle: "Website Development Complete", finished: false),
      CheckList(id: 7, topicTitle: "Testing", finished: false),
      CheckList(id: 8, topicTitle: "Website Launch", finished: false),
    ],
    priority: 1,
    filePath: [
      Files(title: "User Requirements", fileType: convertFileType(".DOCX")),
      Files(title: "Project Assignemnt", fileType: convertFileType(".XLSX")),
      Files(title: "User guidline", fileType: convertFileType(".PPT")),
      Files(title: "Weekly Record Agenda", fileType: convertFileType(".TXT")),
      Files(title: "User manual", fileType: convertFileType(".PDF")),
    ],
  ),
  Projects(
    projType: "Oracle Retail",
    projTitle: "BangJak TTL",
    percent: 80,
    organizer: "Kuss Thankon",
    orgImg:
        "https://www.corvallisclinic.com/wp-content/uploads/Michael-Gray-DPT-COMT-2019.jpg",
    duedate: dateFormatter(DateTime(DateTime.now().year,
        DateTime.now().month + 4, DateTime.now().day + 14)),
    projDetail:
        "Oracle Retail's Assortment & Item Planning Software solves the industry's need for a smart, yet simple assortment strategy and lifecycle management tool to deliver compelling fast fashion assortments."
        ""
        "Oracle Retail provides an integrated, single view of the enterprise, enabling retailers to innovate with speed and scale. With Oracle Retail's Assortment & Item Planning Service, retailers can develop authentic and loyal customer relationships by delivering the right product in the right fulfillment location. Assortment & Item Plannilig provides retailers with a highly visual, end-to-end workflow to define and execute local market assortments, to improve conversion of traffic into sales, and to increase customer satisfaction, while increasing gross margin and return on investment through item-level visibility and the ability to plan and manage this complexity in a user-friendly and cost-reducing manner. Assortment & Item Planning leverages embedded science and automation to provide an effective assortment strategy to maximize return on inventory investment. Assortment & Item Planning Cloud Service's in -season business process provides planners with the ability to quickly and effectively react to season to-date actuals and trends with exception management. With one complete version of the truth through a common business process and calculations and smart starting points, planners are able to easily review and update sales, promotions, and markdown plans. Delivering an effective assortment and item strategy that engages the customer in an omnichannel environment requires a single view of customer, inventory, order, demand and pricing promotions, Oracle Retail's unified approach to planning provides a framework of best practices without inhibiting the art of the merchant -while enabling the retailer to improve the precision and level of detail of assortment and item planning decisions through advanced analytics.",
    status: "In progress",
    numOfparticipant: 18,
    teams: [
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
    projChecklist: [
      CheckList(
          id: 1,
          topicTitle: "Target market and customer analysis",
          finished: true),
      CheckList(
          id: 2,
          topicTitle: "Industry analysis and industry segment",
          finished: true),
      CheckList(id: 3, topicTitle: "Competitor analysis", finished: true),
      CheckList(id: 4, topicTitle: "SWOT analysis", finished: false),
    ],
    priority: 2,
    filePath: [
      Files(title: "User Requirements", fileType: convertFileType(".DOCX")),
      Files(title: "Project Assignemnt", fileType: convertFileType(".XLSX")),
      Files(title: "User guidline", fileType: convertFileType(".PPT")),
      Files(title: "Weekly Record Agenda", fileType: convertFileType(".TXT")),
      Files(title: "User manual", fileType: convertFileType(".PDF")),
    ],
  ),
];

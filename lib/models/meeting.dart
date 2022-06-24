import './participant.dart';

class Meeting {
  String location;
  String meetTitle;
  String? description;
  String organizer;
  String meetIcon;
  String date;
  String time;
  int numOfparticipant;
  List<Participant> part;

  Meeting({
    required this.location,
    required this.meetTitle,
    this.description,
    required this.organizer,
    required this.meetIcon,
    required this.date,
    required this.time,
    required this.numOfparticipant,
    required this.part,
  });
}

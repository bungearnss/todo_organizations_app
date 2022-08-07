import './participant.dart';
import './checklists.dart';
import './files.dart';

class Projects {
  String projType;
  String projTitle;
  double percent;
  String organizer;
  String orgImg;
  String duedate;
  String projDetail;
  String status;
  int numOfparticipant;
  List<Participant> teams;
  List<CheckList> projChecklist;
  int priority;
  List<Files> filePath;

  Projects({
    required this.projType,
    required this.projTitle,
    required this.percent,
    required this.organizer,
    required this.orgImg,
    required this.duedate,
    required this.projDetail,
    required this.status,
    required this.numOfparticipant,
    required this.teams,
    required this.projChecklist,
    required this.priority,
    required this.filePath,
  });
}

import 'package:flutter/material.dart';
import '../../models/participant.dart';

class CleanCalendarEvent {
  String eventTitle;
  String description;
  String location;
  DateTime startTime;
  DateTime endTime;
  Color color;
  bool isAllDay;
  bool isDone;
  List<Participant> part;
  int numOfparticipant;

  CleanCalendarEvent(
    this.eventTitle, {
    this.description = '',
    this.location = '',
    required this.startTime,
    required this.endTime,
    this.color = Colors.blue,
    this.isAllDay = false,
    this.isDone = false,
    required this.part,
    required this.numOfparticipant,
  });
}

import 'package:flutter/material.dart';

class Notifications {
  int notiType;
  String title;
  String subtitle;
  DateTime startTime;
  DateTime? endTime;
  String? organizer;

  Notifications({
    required this.notiType,
    required this.title,
    required this.subtitle,
    required this.startTime,
    this.endTime,
    this.organizer,
  });
}

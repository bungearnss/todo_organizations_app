class Task {
  String id;
  String taskTitle;
  int taskType;
  double? percent;
  bool status;
  DateTime? date;

  Task({
    required this.id,
    required this.taskTitle,
    required this.taskType,
    this.percent,
    required this.status,
    this.date,
  });
}

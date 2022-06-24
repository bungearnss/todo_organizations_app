import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/activitysum.dart';
import '../../models/tasksum.dart';

class StatisticGraph extends StatelessWidget {
  final String type;

  StatisticGraph({required this.type});

  var data = [
    ActivityData('Sun', 40),
    ActivityData('Mon', 80),
    ActivityData('Tue', 20),
    ActivityData('Wed', 50),
    ActivityData('Thu', 50),
    ActivityData('Fri', 60),
    ActivityData('Sat', 70),
  ];

  var data2 = [
    ActivityData('Sun', 50),
    ActivityData('Mon', 40),
    ActivityData('Tue', 60),
    ActivityData('Wed', 60),
    ActivityData('Thu', 78),
    ActivityData('Fri', 67),
    ActivityData('Sat', 75),
  ];

  var tasks = [
    TaskSum('Sun', 3),
    TaskSum('Mon', 8),
    TaskSum('Tue', 5),
    TaskSum('Wed', 10),
    TaskSum('Thu', 7),
    TaskSum('Fri', 6),
    TaskSum('Sat', 5),
  ];

  final preColor = Colors.purple[400];
  final weekColor = Colors.greenAccent[400];

  double taskSum() {
    double sumTask = 0;
    for (TaskSum task in tasks) {
      sumTask = sumTask + task.amount;
    }
    return sumTask;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    initializeDateFormatting('th', null);
    screenTypeLayout() {
      if (type == "line") {
        return lineGraph(width);
      }
      return barGraph(width);
    }

    return screenTypeLayout();
  }

  Widget lineGraph(double width) {
    return SizedBox(
      width: width,
      height: 220,
      child: Card(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, right: 5),
              height: 180,
              child: SfCartesianChart(
                enableAxisAnimation: true,
                primaryXAxis: CategoryAxis(
                  majorGridLines:
                      MajorGridLines(width: 0.5, color: Colors.grey[200]),
                  labelStyle: const TextStyle(fontSize: 10),
                ),
                primaryYAxis: NumericAxis(
                  visibleMaximum: 100,
                  labelFormat: '{value}%',
                  labelStyle: const TextStyle(fontSize: 10),
                  labelAlignment: LabelAlignment.center,
                ),
                tooltipBehavior: TooltipBehavior(
                  color: const Color.fromARGB(255, 160, 160, 160),
                  enable: true,
                  animationDuration: 200,
                  duration: 700,
                ),
                series: <ChartSeries<ActivityData, String>>[
                  LineSeries<ActivityData, String>(
                    name: "this week",
                    isVisible: true,
                    enableTooltip: true,
                    dataSource: data,
                    xValueMapper: (ActivityData item, _) => item.day,
                    yValueMapper: (ActivityData item, _) => item.percent,
                    color: weekColor,
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                  LineSeries<ActivityData, String>(
                    name: "previous week",
                    isVisible: true,
                    enableTooltip: true,
                    dataSource: data2,
                    xValueMapper: (ActivityData item, _) => item.day,
                    yValueMapper: (ActivityData item, _) => item.percent,
                    color: preColor,
                    markerSettings: const MarkerSettings(isVisible: true),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: weekColor,
                        ),
                      ),
                      const Text(
                        "This Week",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(width: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: preColor,
                        ),
                      ),
                      const Text(
                        "Previous Week",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget barGraph(double width) {
    DateTime end = DateTime.now();
    var formatter = DateFormat("MMM d'", 'en');
    final endDate = formatter.format(end);
    final start = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 7);
    final startDate = formatter.format(start);

    return SizedBox(
      width: width,
      height: 220,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tasks Completed",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Total ${taskSum().toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Week $startDate - $endDate",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 5),
              height: 170,
              child: SfCartesianChart(
                enableAxisAnimation: true,
                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  labelStyle: const TextStyle(fontSize: 10),
                ),
                primaryYAxis: NumericAxis(
                  isVisible: true,
                  minimum: 0,
                  maximum: 12,
                  majorGridLines: MajorGridLines(
                    width: 0.5,
                    color: Colors.grey[200],
                  ),
                  labelStyle: const TextStyle(fontSize: 10),
                ),
                tooltipBehavior: TooltipBehavior(
                  color: const Color.fromARGB(255, 160, 160, 160),
                  enable: true,
                  animationDuration: 200,
                  duration: 700,
                  tooltipPosition: TooltipPosition.pointer,
                ),
                series: <ChartSeries<TaskSum, String>>[
                  ColumnSeries<TaskSum, String>(
                      name: "task completed",
                      isVisible: true,
                      enableTooltip: true,
                      dataSource: tasks,
                      xValueMapper: (TaskSum item, _) => item.day,
                      yValueMapper: (TaskSum item, _) => item.amount,
                      color: weekColor,
                      width: 0.3,
                      spacing: 0.2,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(3),
                        topRight: Radius.circular(3),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

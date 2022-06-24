import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircleProgress extends StatelessWidget {
  double percent;
  String title;
  Color color;
  double radius;

  CircleProgress({
    required this.percent,
    required this.title,
    required this.color,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    String percentFormatter = (percent * 100).toStringAsFixed(1);
    return CircularPercentIndicator(
      backgroundColor: Colors.grey[200]!,
      radius: radius,
      lineWidth: 5.0,
      animation: true,
      animationDuration: 800,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: color,
      center: Text(
        "$percentFormatter%",
        style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 13),
      ),
      footer: Container(
        width: 80,
        padding: const EdgeInsets.only(top: 7),
        child: Center(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 14, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

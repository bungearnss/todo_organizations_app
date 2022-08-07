import 'package:flutter/material.dart';

import '../utility/mockdata.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final Color? color;

  Badge({
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final totalNoti = notiInfo.length;
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          left: 5,
          top: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: color ?? Colors.red[600],
            ),
            constraints: const BoxConstraints(maxWidth: 25, minHeight: 16),
            child: Text(
              totalNoti.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 8),
            ),
          ),
        )
      ],
    );
  }
}

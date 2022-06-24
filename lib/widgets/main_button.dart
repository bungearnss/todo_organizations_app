import 'package:flutter/material.dart';

import '../utility/constant.dart';

class MainButton extends StatelessWidget {
  String title;
  Function()? onPressed;

  MainButton({required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final ButtonStyle buttonStyle = TextButton.styleFrom(
      backgroundColor: themeColor,
      fixedSize: Size(width * 0.8, 50),
      // padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
    return TextButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

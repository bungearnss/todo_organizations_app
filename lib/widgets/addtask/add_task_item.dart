import 'package:flutter/material.dart';

class AddTaskItem extends StatelessWidget {
  String labelTitle;
  Widget child;
  Function()? onPressed;
  IconData? iconName;
  Color? iconColor;
  String type;

  AddTaskItem({
    required this.labelTitle,
    required this.child,
    this.onPressed,
    this.iconName,
    this.iconColor,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey[300]!,
          ),
        ),
      ),
      padding: type == "setting"
          ? const EdgeInsets.symmetric(horizontal: 0)
          : const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (type == "setting")
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                margin: const EdgeInsets.symmetric(horizontal: 13.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: iconColor,
                ),
                child: Icon(
                  iconName,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            )
          else
            Container(),
          Expanded(
            flex: 3,
            child: Text(
              labelTitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                child,
                IconButton(
                  alignment: Alignment.centerRight,
                  // padding: const EdgeInsets.only(top: 5.0, right: 5.0),
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.grey[400],
                    size: 22,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

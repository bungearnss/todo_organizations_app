import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../utility/constant.dart';

CustomBottomModal(BuildContext context, {required Widget widget}) async {
  return await showMaterialModalBottomSheet(
    context: context,
    expand: false,
    backgroundColor: Colors.transparent,
    builder: (context) => widget,
  );
}

class LabelTypeModal {
  static Future getBottomSheet(BuildContext context,
      {required ValueChanged<int> onChanged}) async {
    await CustomBottomModal(
      context,
      widget: Material(
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text(
                  "Activity",
                  style: TextStyle(fontSize: 14),
                ),
                leading: const Icon(Icons.run_circle_outlined),
                trailing: Container(
                  margin: const EdgeInsets.only(right: 7),
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: activityColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  onChanged(1);
                },
              ),
              ListTile(
                title: const Text(
                  "Learning",
                  style: TextStyle(fontSize: 14),
                ),
                leading: const Icon(Icons.book_outlined),
                trailing: Container(
                  margin: const EdgeInsets.only(right: 7),
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: learningColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  onChanged(2);
                },
              ),
              ListTile(
                title: const Text(
                  "Working",
                  style: TextStyle(fontSize: 14),
                ),
                leading: const Icon(Icons.work_history_outlined),
                trailing: Container(
                  margin: const EdgeInsets.only(right: 7),
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: workingColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  onChanged(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../utility/constant.dart';

class CheckListItem extends StatelessWidget {
  String title;
  bool finished;
  int id;

  CheckListItem(
      {required this.title, required this.finished, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          finished == true
              ? Icon(
                  Icons.check_circle,
                  color: greenLight,
                  size: 20,
                )
              : const Icon(
                  Icons.circle_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

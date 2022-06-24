import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utility/constant.dart';

class OptionItem extends StatelessWidget {
  final Function onSwitched;
  final String label;
  final bool status;

  OptionItem(
      {required this.onSwitched, required this.label, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      margin: const EdgeInsets.only(left: 15.0),
      height: 50.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey[300]!,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Transform.scale(
              scale: 0.75,
              alignment: Alignment.centerRight,
              child: CupertinoSwitch(
                activeColor: greenLight,
                trackColor: Colors.grey[300],
                value: status,
                onChanged: (newValue) {
                  onSwitched(newValue);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

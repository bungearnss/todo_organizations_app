import 'package:flutter/material.dart';

import '../utility/constant.dart';
import '../utility/mockdata.dart';
import '../widgets/addtask/add_task_item.dart';
import '../widgets/settings/option_item.dart';
import '../widgets/main_button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool reminderStatus = false;
  bool newStatus = false;
  bool modeStatus = false;

  onSwitchedOpt1(bool status1) {
    setState(() {
      reminderStatus = status1;
    });
  }

  onSwitchedOpt2(bool status2) {
    setState(() {
      newStatus = status2;
    });
  }

  onSwitchedOpt3(bool status3) {
    setState(() {
      modeStatus = status3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        // margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        // color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Colors.grey[400]!,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(userprofile.profilepic),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userprofile.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "@${userprofile.username} : ${userprofile.position}",
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        width: 60,
                        height: 45,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            "View",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(123, 123, 123, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0),
              child: Text(
                "Account",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.black, fontSize: 18),
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              padding: const EdgeInsets.only(right: 15.0),
              child: Column(
                children: [
                  AddTaskItem(
                    labelTitle: "Change Password",
                    type: "setting",
                    iconName: Icons.lock_outline_rounded,
                    iconColor: greenLight,
                    child: Container(),
                  ),
                  AddTaskItem(
                    labelTitle: "Notifications",
                    type: "setting",
                    iconName: Icons.notifications_active,
                    iconColor: pinkLight,
                    child: Container(),
                  ),
                  AddTaskItem(
                    labelTitle: "Privacy Settings",
                    type: "setting",
                    iconName: Icons.health_and_safety_rounded,
                    iconColor: yellowLight,
                    child: Container(),
                  ),
                  AddTaskItem(
                    labelTitle: "Language",
                    type: "setting",
                    iconName: Icons.language_outlined,
                    iconColor: purpleLight,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "More Options",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.black, fontSize: 18),
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                children: [
                  OptionItem(
                    onSwitched: onSwitchedOpt1,
                    label: "Enable Auto Reminders",
                    status: reminderStatus,
                  ),
                  OptionItem(
                    onSwitched: onSwitchedOpt2,
                    label: "News letter",
                    status: newStatus,
                  ),
                  OptionItem(
                    onSwitched: onSwitchedOpt3,
                    label: "Dark Mode",
                    status: modeStatus,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: MainButton(
                  title: "Sign Out",
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

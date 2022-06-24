import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utility/constant.dart';
import '../widgets/addtask/label_type_modal.dart';
import '../widgets/addtask/add_task_item.dart';
import '../widgets/main_button.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _textController = TextEditingController();
  var currentFocus;
  Color? typeColor = activityColor;
  String typeText = "Activity";
  bool hideBorder = false;
  FocusNode myFocusNode = FocusNode();

  void _printLatestValue() {
    print('text field: ${_textController.text}');
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _textController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _textController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  unfocusKeyboard() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  changeType(int type) {
    switch (type) {
      case 1:
        setState(() {
          typeColor = activityColor;
          typeText = "Activity";
        });
        break;
      case 2:
        setState(() {
          typeColor = learningColor;
          typeText = "Learning";
        });
        break;
      case 3:
        setState(() {
          typeColor = workingColor;
          typeText = "Working";
        });
        break;
    }
  }

  hideBorderFocus() {
    if (myFocusNode.hasFocus) {
      setState(() {
        hideBorder = true;
      });
    } else {
      setState(() {
        hideBorder = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    hideBorderFocus();

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Add New Task",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        decoration: hideBorder == true
                            ? null
                            : BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 0.5,
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                              ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            controller: _textController,
                            focusNode: myFocusNode,
                            textInputAction: TextInputAction.done,
                            onChanged: (text) {
                              setState(() {});
                            },
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter your task title',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: themeColor, width: 1),
                              ),
                              border: InputBorder.none,
                              suffixIcon: _textController.text.isEmpty
                                  ? null
                                  : IconButton(
                                      alignment: Alignment.centerRight,
                                      onPressed: () {
                                        _textController.clear();
                                        unfocusKeyboard();
                                      },
                                      icon: const Icon(
                                        Icons.cancel_sharp,
                                        size: 14,
                                        color:
                                            Color.fromARGB(255, 208, 207, 207),
                                      ),
                                    ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                      AddTaskItem(
                          type: "addtask",
                          labelTitle: "Label",
                          child: Row(
                            children: [
                              Container(
                                width: 7,
                                height: 7,
                                margin: const EdgeInsets.only(right: 8.0),
                                decoration: BoxDecoration(
                                  color: typeColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Text(
                                typeText,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            LabelTypeModal.getBottomSheet(
                              context,
                              onChanged: (int result) async {
                                changeType(result);
                              },
                            );
                          }),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      AddTaskItem(
                        type: "addtask",
                        labelTitle: "Due",
                        child: Row(children: [
                          Icon(
                            Icons.calendar_month_rounded,
                            size: 18,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            DateFormat('MMM d, yyyy').format(DateTime.now()),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ]),
                        onPressed: () {},
                      ),
                      AddTaskItem(
                        type: "addtask",
                        labelTitle: "Repeat",
                        child: Text(
                          "Never",
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      AddTaskItem(
                        type: "addtask",
                        labelTitle: "Reminders",
                        child: const Text(
                          "Not reminders",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      AddTaskItem(
                        type: "addtask",
                        labelTitle: "Location",
                        child: Row(children: [
                          Icon(
                            Icons.location_pin,
                            size: 18,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Jenny's Mart",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ]),
                        onPressed: () {},
                      ),
                      AddTaskItem(
                        type: "addtask",
                        labelTitle: "Status",
                        child: Text(
                          "Incomplete",
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      AddTaskItem(
                        type: "addtask",
                        labelTitle: "Percent",
                        child: const Text(
                          "Show",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: MainButton(title: "Add Task"),
            ),
          ],
        ),
      ),
    );
  }
}

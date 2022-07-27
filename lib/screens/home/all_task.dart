import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../models/tasks.dart';
import '../../utility/mockdata.dart';
import '../../utility/constant.dart';
import '../../widgets/home/today_task_listitem.dart';

class AllTodayTask extends StatefulWidget {
  const AllTodayTask({Key? key}) : super(key: key);

  @override
  State<AllTodayTask> createState() => _AllTodayTaskState();
}

class _AllTodayTaskState extends State<AllTodayTask> {
  int? tappedIndex;
  List<Task> filterTask = [];

  @override
  void initState() {
    tappedIndex = 0;
    filterTask = myTasks;
    super.initState();
  }

  void filterList(String tabType) {
    // print("tabType $tabType");
    if (tabType == "Learning") {
      setState(() {
        filterTask = myTasks.where((type) => type.taskType == 1).toList();
      });
    } else if (tabType == "Working") {
      setState(() {
        filterTask = myTasks.where((type) => type.taskType == 2).toList();
      });
    } else if (tabType == "Activity") {
      setState(() {
        filterTask = myTasks.where((type) => type.taskType == 3).toList();
      });
    } else if (tabType == "All") {
      filterTask = myTasks;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final taskNum = myTasks.length;

    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Your Tasks",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.black, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 2, bottom: 8, left: 15.0, right: 15),
                child: Text(
                  "Today you have $taskNum tasks",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                padding: const EdgeInsets.only(bottom: 10.0, left: 5.0),
                width: width,
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.6,
                      color: Colors.grey[300]!,
                    ),
                  ),
                ),
                child: renderTaskType(),
              ),
              SizedBox(
                width: width,
                height: height,
                child: ListView.builder(
                    itemCount: filterTask.length,
                    itemBuilder: (context, index) {
                      final item = filterTask[index];
                      return Slidable(
                        key: ValueKey(item.id),
                        endActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          dismissible: DismissiblePane(onDismissed: () {}),
                          children: [
                            SlidableAction(
                              onPressed: null,
                              backgroundColor: greenLight!,
                              foregroundColor: Colors.white,
                              icon: Icons.check,
                            ),
                            const SlidableAction(
                              onPressed: null,
                              backgroundColor: Colors.lightBlue,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                            ),
                            const SlidableAction(
                              onPressed: null,
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete_rounded,
                            )
                          ],
                        ),
                        child: TodayTaskListItem(
                          taskTitle: filterTask[index].taskTitle,
                          taskType: filterTask[index].taskType,
                          date: filterTask[index].date,
                          completeStatus: filterTask[index].status,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize? appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.chevron_left_outlined,
                color: Color.fromARGB(255, 59, 59, 59),
                size: 23,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              radius: 13,
              backgroundImage: NetworkImage(userprofile.profilepic),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderTaskType() {
    List<String> taskTitle = ["All", "Learning", "Working", "Activity"];
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: taskTitle.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  tappedIndex = index;
                  filterList(taskTitle[index]);
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: tappedIndex == index ? themeColor : Colors.grey[200],
                ),
                child: Center(
                  child: Text(
                    taskTitle[index],
                    style: TextStyle(
                      color: tappedIndex == index
                          ? Colors.white
                          : Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                ),
              ));
        }));
  }
}

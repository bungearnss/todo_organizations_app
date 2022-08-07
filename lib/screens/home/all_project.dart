import 'package:flutter/material.dart';

import '../../utility/mockdata.dart';
import '../../widgets/home/project_item.dart';

class AllProject extends StatefulWidget {
  const AllProject({Key? key}) : super(key: key);

  @override
  State<AllProject> createState() => _AllProjectState();
}

class _AllProjectState extends State<AllProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        padding:
            const EdgeInsets.only(left: 12.0, right: 12, bottom: 12, top: 16),
        child: GridView.builder(
            itemCount: projInfo.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 1.4,
            ),
            itemBuilder: (context, index) {
              final item = projInfo[index];
              return ProjectItem(
                /*   projType: item.projType,
                projTitle: item.projTitle,
                percent: item.percent,
                organizer: item.organizer,
                orgImg: item.orgImg, */
                projectInfo: item,
              );
            }),
      ),
    );
  }

  PreferredSize? appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: AppBar(
        backgroundColor: Colors.white,
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
        title: const Text(
          "My Projects",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.search,
              color: Color.fromARGB(255, 59, 59, 59),
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utility/mockdata.dart';

PreferredSize? gradientAppbar(BuildContext context) {
  final dateNow = DateTime.now();
  String dateFormatter = DateFormat.yMMMMEEEEd().format(dateNow);
  return PreferredSize(
    preferredSize: const Size.fromHeight(120.0),
    child: AppBar(
      leading: const IconButton(
        icon: Icon(
          Icons.search_outlined,
          color: Colors.white,
        ),
        onPressed: null,
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ),
      ],
      elevation: 0,
      flexibleSpace: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(120, 105, 250, 1),
                    Color.fromRGBO(87, 80, 252, 1)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15.0,
            left: 15.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(userprofile.profilepic),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello ${userprofile.name}!",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Your tasks on $dateFormatter",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

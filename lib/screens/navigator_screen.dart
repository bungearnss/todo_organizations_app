import 'package:flutter/material.dart';

import './index.dart';
import '../widgets/gradient_appbar.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _screenOptions = <Widget>[
    const HomeScreen(),
    const CalendarScreen(),
    const AddTaskScreen(),
    DashBoardScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: _screenOptions.elementAt(_selectedIndex),
        bottomNavigationBar: SizedBox(
          height: 65,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            elevation: 1,
            selectedItemColor: const Color.fromRGBO(120, 105, 250, 1),
            unselectedIconTheme: IconThemeData(
              color: Colors.grey[500],
              size: 24.0,
            ),
            selectedIconTheme: const IconThemeData(
              color: Color.fromRGBO(120, 105, 250, 1),
              size: 26.0,
            ),
            selectedLabelStyle: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 12,
                  color: const Color.fromRGBO(120, 105, 250, 1),
                ),
            unselectedLabelStyle:
                Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 11,
                      color: Colors.grey[500],
                    ),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined),
                label: "Calendar",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_to_photos_rounded),
                label: "Add Task",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph_outlined),
                label: "Statistic",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Setting",
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

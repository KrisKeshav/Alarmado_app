import 'package:alarmado/app/data/data.dart';
import 'package:alarmado/app/data/enums.dart';
import 'package:alarmado/app/data/models/menu_info.dart';
import 'package:alarmado/app/data/theme_data.dart';
import 'package:alarmado/screens/alarm_screen.dart';
import 'package:alarmado/screens/clock_screen.dart';
import 'package:alarmado/screens/stopwatch_screen.dart';
import 'package:alarmado/screens/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Row(
        children: <Widget>[
          // Sidebar with menu buttons
          Container(
            width: mq.width * 0.25, // Adjust width as needed
            color: CustomColors.sidebarBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems.map((currentMenuInfo) => buildMenuButton(currentMenuInfo)).toList(),
            ),
          ),
          VerticalDivider(
            color: CustomColors.dividerColor,
            width: 1,
          ),
          // Main content area
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                switch (value.menuType) {
                  case MenuType.clock:
                    return ClockPage();
                  case MenuType.alarm:
                    return AlarmPage();
                  case MenuType.timer:
                    return TimerPage();
                  case MenuType.stopwatch:
                    return StopwatchPage();
                  default:
                    return Center(
                      child: Text(
                        'Select an option from the menu',
                        style: TextStyle(
                          fontFamily: 'avenir',
                          color: CustomColors.primaryTextColor,
                          fontSize: 20,
                        ),
                      ),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return GestureDetector(
          onTap: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: currentMenuInfo.menuType == value.menuType ? CustomColors.menuBackgroundColor : CustomColors.pageBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(4, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  currentMenuInfo.imageSource!,
                  scale: 1.5,
                ),
                SizedBox(height: 12),
                Text(
                  currentMenuInfo.title ?? '',
                  style: TextStyle(
                    fontFamily: 'avenir',
                    color: CustomColors.primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

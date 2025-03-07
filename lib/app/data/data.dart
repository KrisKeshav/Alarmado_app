

import 'package:alarmado/app/data/enums.dart';
import 'package:alarmado/app/data/models/alarm_info.dart';
import 'package:alarmado/app/data/models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock, title: 'Clock', imageSource: 'assets/images/clock_icon.png'),
  MenuInfo(MenuType.alarm, title: 'Alarm', imageSource: 'assets/images/alarm_icon.png'),
  MenuInfo(MenuType.timer, title: 'Timer', imageSource: 'assets/images/timer_icon.png'),
  MenuInfo(MenuType.stopwatch, title: 'Stopwatch', imageSource: 'assets/images/stopwatch_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(alarmDateTime: DateTime.now().add(Duration(hours: 1)), title: 'Office', gradientColorIndex: 0),
  AlarmInfo(alarmDateTime: DateTime.now().add(Duration(hours: 2)), title: 'Sport', gradientColorIndex: 1),
];
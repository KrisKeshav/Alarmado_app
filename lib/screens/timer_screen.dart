import 'dart:async';
import 'package:alarmado/app/data/theme_data.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late Timer _timer;
  Duration _duration = Duration.zero;
  bool _isRunning = false;
  late DateTime _startTime;

  void _startTimer() {
    _startTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final elapsed = DateTime.now().difference(_startTime);
      if (elapsed >= _duration) {
        timer.cancel();
        setState(() {
          _isRunning = false;
        });
      } else {
        setState(() {
          _duration = elapsed;
        });
      }
    });
    setState(() {
      _isRunning = true;
    });
  }

  void _stopTimer() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _duration = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Timer',
            style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700,
              color: CustomColors.primaryTextColor,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 48),
          Text(
            _duration.toString().split('.').first.padLeft(8, "0"),
            style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700,
              color: CustomColors.primaryTextColor,
              fontSize: 64,
            ),
          ),
          SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _isRunning ? _stopTimer : _startTimer,
                child: Text(_isRunning ? 'Stop' : 'Start'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _resetTimer,
                child: Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

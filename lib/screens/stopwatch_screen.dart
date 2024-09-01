import 'dart:async';
import 'package:alarmado/app/data/theme_data.dart';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Timer _timer;
  Duration _elapsedTime = Duration.zero;
  bool _isRunning = false;
  late DateTime _startTime;

  void _startStopwatch() {
    _startTime = DateTime.now();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      final elapsed = DateTime.now().difference(_startTime);
      setState(() {
        _elapsedTime = elapsed;
      });
    });
    setState(() {
      _isRunning = true;
    });
  }

  void _stopStopwatch() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _resetStopwatch() {
    _stopStopwatch();
    setState(() {
      _elapsedTime = Duration.zero;
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
            'Stopwatch',
            style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700,
              color: CustomColors.primaryTextColor,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 48),
          Text(
            _elapsedTime.toString().split('.').first.padLeft(8, "0"),
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
                onPressed: _isRunning ? _stopStopwatch : _startStopwatch,
                child: Text(_isRunning ? 'Stop' : 'Start'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _resetStopwatch,
                child: Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

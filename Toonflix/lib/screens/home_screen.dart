import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const refreshTime = 300;
  static const timeList = [900, 1200, 1500, 1800, 2100];
  int selectedTime = 1500;
  int totalSeconds = 5;
  late Timer timer;
  int totalPomodoros = 3;
  int totalGoal = 0;
  bool isRunning = false;
  bool isRefresh = false;

  void onTick(Timer timer) {
    if (totalSeconds == 0 && !isRefresh) {
      setState(() {
        totalPomodoros++;
        // isRunning = false;
        isRefresh = !isRefresh;
        totalSeconds = refreshTime;
        if (totalPomodoros == 4) {
          if (totalGoal < 13) {
            totalGoal++;
          }
          totalPomodoros = 0;
        }
      });
      // timer.cancel();
    } else if (totalSeconds == 0 && isRefresh) {
      setState(() {
        totalSeconds = totalSeconds - 1;
        isRefresh = !isRefresh;
        totalSeconds = selectedTime;
      });
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = !isRunning;
    });
  }

  void onPausedPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetTime() {
    timer.cancel();
    setState(() {
      totalSeconds = selectedTime;
      isRunning = false;
      isRefresh = false;
    });
  }

  String format(int seconds) {
    var duration =
        Duration(seconds: seconds).toString().split(".").first.substring(2, 7);
    return duration;
  }

  void changeTimer(int seconds) {
    setState(() {
      selectedTime = seconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                    color: isRefresh
                        ? Colors.lightBlueAccent
                        : Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: timeList.map((item) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        changeTimer(item);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 4,
                              color: selectedTime == item
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.6),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 24,
                          ),
                          child: Text(
                            Duration(seconds: item).inMinutes.toString(),
                            style: TextStyle(
                              color: selectedTime == item
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.6),
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                );
              }).toList()),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: isRunning ? onPausedPressed : onStartPressed,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline,
                      size: 98,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: onResetTime,
                    icon: Icon(
                      Icons.replay_circle_filled_outlined,
                      size: 98,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'ROUND',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .color,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '$totalPomodoros/4',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .color,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'GOAL',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .color,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '$totalGoal/12',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .color,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

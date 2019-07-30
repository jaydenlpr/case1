
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:case1/widget/DragBox.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color caughtColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Case 1",
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Case 1"),
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(20),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  " We would like to know how often you have felt this way during the past week."
                  " Please drag and drop the sentences below into the buckets.",
                  style: TextStyle(
                    color: Colors.blue[900],
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "I was bothered by things that usually don't bother me.",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 13
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  DragBox(
                      Offset(30.0, 30.0),
                      Size(110, 110),
                      'Rarely or none of the time(less than 1 day)',
                      Colors.blueAccent),
                  DragBox(
                      Offset(170.0, 20.0),
                      Size(130, 130),
                      'Some or little or the time(1~2 days)',
                      Colors.blueAccent),
                  DragBox(
                      Offset(60.0, 150.0),
                      Size(120, 120),
                      'Occasionally or a moderate amount of time(3~4 days)',
                      Colors.blueAccent),
                  DragBox(
                      Offset(200.0, 160.0),
                      Size(100, 100),
                      'Most or all of the time(1~2 days)',
                      Colors.blueAccent),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: <Widget>[
                  DragTarget(
                    onAccept: (Color color) {
                      caughtColor = color;
                    },
                    builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                        ) {
                      return Container(
                        width: 90.0,
                        height: 90.0,
                        padding: accepted.isEmpty ? EdgeInsets.all(15) : EdgeInsets.all(4),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/box-green.png',
                                fit: BoxFit.cover,
                              ),
                              Text("Love it")
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  DragTarget(
                    onAccept: (Color color) {
                      caughtColor = color;
                    },
                    builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                        ) {
                      return Container(
                        width: 90.0,
                        height: 90.0,
                        padding: accepted.isEmpty ? EdgeInsets.all(15) : EdgeInsets.all(4),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/box-blue.png',
                                fit: BoxFit.cover,
                              ),
                              Text("Like it")
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  DragTarget(
                    onAccept: (Color color) {
                      caughtColor = color;
                    },
                    builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                        ) {
                      return Container(
                        width: 90.0,
                        height: 90.0,
                        padding: accepted.isEmpty ? EdgeInsets.all(15) : EdgeInsets.all(4),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/box-yellow.png',
                                fit: BoxFit.cover,
                              ),
                              Text("It's Okay")
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  DragTarget(
                    onAccept: (Color color) {
                      caughtColor = color;
                    },
                    builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                        ) {
                      return Container(
                        width: 90.0,
                        height: 90.0,
                        padding: accepted.isEmpty ? EdgeInsets.all(15) : EdgeInsets.all(4),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/box-red.png',
                                fit: BoxFit.cover,
                              ),
                              Text("Hate it!")
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
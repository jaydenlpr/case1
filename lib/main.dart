import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  Color caughtColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        DragBox(
            Offset(20.0, 100.0),
            Size(110, 110),
            'Rarely or none of the time(less than 1 day)',
            Colors.blueAccent),
        DragBox(
            Offset(170.0, 100.0),
            Size(130, 130),
            'Some or little or the time(1~2 days)',
            Colors.blueAccent),
        DragBox(
            Offset(60.0, 220.0),
            Size(130, 130),
            'Occasionally or a moderate amount of time(3~4 days)',
            Colors.blueAccent),
        DragBox(
            Offset(200.0, 240.0),
            Size(100, 100),
            'Most or all of the time(1~2 days)',
            Colors.blueAccent),

        Positioned(
          left: 0.0,
          bottom: 0.0,
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
    );
  }
}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Size itemSize;
  final Color itemColor;

  DragBox(this.initPos, this.itemSize, this.label, this.itemColor);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: Container(
            width: widget.itemSize.width,
            height: widget.itemSize.height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 2)
            ),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
//              position = offset;
            });
          },
          childWhenDragging: Container(),
          feedback: Container(
            width: widget.itemSize.width,
            height: widget.itemSize.height,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 2)
            ),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ));
  }
}



import 'package:flutter/material.dart';

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
      )
    );
  }
}

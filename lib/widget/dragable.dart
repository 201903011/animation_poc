import 'package:flutter/material.dart';

class DraggableContainer extends StatefulWidget {
  @override
  _DraggableContainerState createState() => _DraggableContainerState();
}

class _DraggableContainerState extends State<DraggableContainer>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
  }

  double width1 = 300;
  double height1 = 180;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      childWhenDragging: Container(),
      feedback: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        alignment: Alignment.center,
        width: width1,
        height: height1,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Dragging',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
      onDragUpdate: (details) {
        print('Drag update ${details.delta} ${details.localPosition}');

        if (details.localPosition.dx < 120 && details.localPosition.dx > 80) {
          width1 = 300 * 0.7;
          height1 = 180 * 0.7;
          print("x==>1");
          setState(() {});
        }
        if (details.localPosition.dx < 80) {
          width1 = 300 * 0.5;
          height1 = 180 * 0.5;
          print("x==>2");
          setState(() {});
        }
        // setState(() {});
        // print('Drag update ${width1} ${height1}');
      },
      onDraggableCanceled: (velocity, offset) {
        print('Drag canceled');
        width1 = 300;
        height1 = 180;
        setState(() {});
      },
      onDragCompleted: () {
        print('Drag completed');
      },
      onDragStarted: () {
        // print('Drag started');
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 300,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Drag me',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

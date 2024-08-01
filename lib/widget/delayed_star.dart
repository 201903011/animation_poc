import 'dart:async';

import 'package:animation/widget/orbit_background.dart';
import 'package:flutter/material.dart';

class DelayedStar extends StatefulWidget {
  @override
  _DelayedStarState createState() => _DelayedStarState();
}

class _DelayedStarState extends State<DelayedStar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Start the animation after 30 seconds
    // Timer(Duration(seconds: 30), () {
    //   _controller.forward();
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _delayedDisplay() async {
    await Future.delayed(Duration(seconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: _delayedDisplay(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return FadeTransition(
              opacity: _animation,
              child: StarCommonWidget(isBlink: true),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class ShakeButton extends StatefulWidget {
  @override
  _ShakeButtonState createState() => _ShakeButtonState();
}

class _ShakeButtonState extends State<ShakeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;
  int _shakeCount = 0;
  final int _totalShakes = 3;

  bool _canVibrate = true;
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _shakeAnimation = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _shakeAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_shakeCount < _totalShakes) {
          _controller.reverse();
        } else {
          _shakeCount = 0;
        }
      } else if (status == AnimationStatus.dismissed) {
        if (_shakeCount < _totalShakes) {
          _shakeCount++;
          _controller.forward();
        }
      }
    });
  }

  Future<void> _init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
      _canVibrate
          ? debugPrint('This device can vibrate')
          : debugPrint('This device cannot vibrate');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _shakeButton() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shake Button Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {},
          child: AnimatedBuilder(
            animation: _shakeAnimation,
            child: ElevatedButton(
              onPressed: () {
                _controller.reset();
                _controller.forward();
                if (_canVibrate) {
                  Vibrate.vibrateWithPauses(pauses);
                }
              },
              child: Text('Shake Me!'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(_shakeAnimation.value, 0),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}

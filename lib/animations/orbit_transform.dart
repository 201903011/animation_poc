import 'package:animation/widget/orbit_background.dart';
import 'package:animation/widget/painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class OrbitTransformAnimation extends StatefulWidget {
  const OrbitTransformAnimation({super.key});

  @override
  State<OrbitTransformAnimation> createState() =>
      _OrbitTransformAnimationState();
}

class _OrbitTransformAnimationState extends State<OrbitTransformAnimation>
    with SingleTickerProviderStateMixin {
  double percent = 0.25;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )..repeat(); // Repeat the animation indefinitely
  }

  static final Animatable<double> _rotationTween =
      CurveTween(curve: Curves.linear);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff141414),
      body: Stack(
        children: [
          OuterCircle(),
          innerShaddow(width),
          InnerCircle(),
          outerShaddow(width),
          Positioned(
            top: 30,
            right: 0,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * 3.14159,
                  // angle: 1.272170492, // Full rotation in radians
                  child: starsObject(width),
                );
              },
            ),
          ),
          Column(
            children: [
              Container(
                height: 270,
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                      width: double.maxFinite,
                      height: 80,
                      decoration: const BoxDecoration(),
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: 8,
                              // width: double.maxFinite,
                              width: percent > 0.99
                                  ? double.maxFinite
                                  : percent <= 0
                                      ? 0
                                      : (width - 32) * percent,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xffD4D3DD),
                                  Color(0xffEFEFBB),
                                  Color(0xffEEA849),
                                  Color(0xffEE6111),
                                ]),
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     Stack(
                            //       children: [
                            //         AnimatedContainer(
                            //           duration: const Duration(seconds: 1),
                            //           height: 8,
                            //           width: 200,
                            //           decoration: BoxDecoration(
                            //             color: Color(0xff262423),
                            //             borderRadius: BorderRadius.horizontal(
                            //                 left: Radius.elliptical(22, 22),
                            //                 right: Radius.circular(22)),
                            //           ),
                            //           // child: CustomPaint(
                            //           //   painter: ConcaveCircularPainter(),
                            //           // ),
                            //         ),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  padding: const EdgeInsets.all(16),
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (percent >= 0.25) {
                                  percent = percent - 0.25;
                                  setState(() {});
                                }
                              },
                              child: const Text("Previous"),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (percent < 1) {
                                  percent = percent + 0.25;
                                  setState(() {});
                                }
                              },
                              child: const Text("Next"),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 15,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrbitAnimation extends StatefulWidget {
  const OrbitAnimation({super.key});

  @override
  State<OrbitAnimation> createState() => _OrbitAnimationState();
}

class _OrbitAnimationState extends State<OrbitAnimation> {
  double percent = 0.25;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff000122),
      body: Stack(
        children: [
          Column(
            children: [
              Lottie.asset("assets/files/orbit.json",
                  repeat: true, fit: BoxFit.fitWidth),
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
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            Color(0xff000122),
                            Color(0xff000122),
                            Color(0x00000122)
                          ])),
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: 20,
                              width: percent > 0.99
                                  ? double.maxFinite
                                  : percent <= 0
                                      ? 0
                                      : (width - 32) * percent,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.white,
                                  Colors.white,
                                  Colors.amber.shade800,
                                ]),
                                borderRadius: BorderRadius.circular(22),
                              ),
                            )
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
          )
        ],
      ),
    );
  }
}

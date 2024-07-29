// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CurtainAnimation extends StatelessWidget {
  CurtainAnimation({super.key});

  var controller1 = RestartAnimationController();
  var controller2 = RestartAnimationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Curtain Animation"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              addSemanticIndexes: false,
              children: [
                VisibilityDetector(
                  onVisibilityChanged: (info) {
                    var visiblePercentage = info.visibleFraction * 100;
                    debugPrint(
                        'Widget ${info.key} is ${visiblePercentage}% visible');
                    if (visiblePercentage > 90.00) {
                      controller1.restartAnimation();
                    }
                  },
                  key: const Key("widget1"),
                  child: CurtainCard(controller: controller1),
                ),
                const SizedBox(height: 750),
                VisibilityDetector(
                  onVisibilityChanged: (info) {
                    var visiblePercentage = info.visibleFraction * 100;
                    debugPrint(
                        'Widget ${info.key} is ${visiblePercentage}% visible');
                    if (visiblePercentage > 80.00) {
                      controller2.restartAnimation();
                    }
                  },
                  key: const Key("widget2"),
                  child: CurtainCard(
                    controller: controller2,
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

class RestartAnimationController {
  late void Function() restartAnimation;
}

class CurtainCard extends StatefulWidget {
  final RestartAnimationController controller;
  const CurtainCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CurtainCard> createState() => _CurtainCardState(controller);
}

class _CurtainCardState extends State<CurtainCard>
    with TickerProviderStateMixin {
  _CurtainCardState(RestartAnimationController controller) {
    controller.restartAnimation = restartAnimation;
  }

  AnimationController? controller;

  restartAnimation() async {
    final assetPath = 'audio/test.m4a'; // Update with your file path
    _audioPlayer.play(
      AssetSource(assetPath),
    );
    controller?.animateTo(1, duration: Duration(seconds: 5));
    // setState(() {

    //   key1 = Key("Abc");
    // });
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  bool repeat = false;
  var key1 = Key("Lottie1");

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          height: 200,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          right: 10,
          child: Lottie.asset(
            key: key1,
            controller: controller,
            "assets/files/bookmark-lottie.json",
            repeat: false,
          ),
        ),
      ],
    );
  }
}

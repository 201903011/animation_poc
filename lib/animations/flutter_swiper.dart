import 'package:animation/widget/example_card.dart';
import 'package:animation/widget/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class FlutterSwiper extends StatefulWidget {
  const FlutterSwiper({
    super.key,
  });

  @override
  State<FlutterSwiper> createState() => _FlutterSwiperState();
}

class _FlutterSwiperState extends State<FlutterSwiper> {
  final CardSwiperController controller = CardSwiperController();

  final cards = candidates.map(ExampleCard.new).toList();

  bool isVisible = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Swiper"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 350,
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Visibility(
                          visible: isVisible,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.moveTo(0);
                              setState(() {
                                isVisible = false;
                              });
                            },
                            child: Text("Reload"),
                          ),
                        ),
                        CardSwiper(
                          controller: controller,
                          cardsCount: cards.length,
                          isLoop: false,
                          allowedSwipeDirection:
                              AllowedSwipeDirection.symmetric(horizontal: true),
                          onSwipe: _onSwipe,
                          onUndo: _onUndo,
                          numberOfCardsDisplayed: 2,
                          backCardOffset: const Offset(40, 40),
                          padding: const EdgeInsets.all(24.0),
                          onEnd: () {
                            setState(() {
                              isVisible = true;
                            });
                          },
                          // maxAngle: 20,
                          scale: 0.7,
                          threshold: 15,
                          cardBuilder: (
                            context,
                            index,
                            horizontalThresholdPercentage,
                            verticalThresholdPercentage,
                          ) =>
                              cards[index],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class FlipCardPage extends StatefulWidget {
  const FlipCardPage({super.key});

  @override
  _FlipCardPageState createState() => _FlipCardPageState();
}

class _FlipCardPageState extends State<FlipCardPage> {
  int count = 0;
  FlipCardController flop = FlipCardController();

  Future<void> flipCard() async {
    // setState(() {
    //   _isFlipped = !_isFlipped;
    // });
    await flop.toggleCard();
    await flop.toggleCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flip Card Animation'),
      ),
      body: Center(
        child: FlipCard(
          flipOnTouch: false,
          onFlipDone: (status) {
            // Flip is done. You can handle any action here.
            print('Flip Done: $status');
            if (count < 2) {
              count++;
              flop.toggleCard();
            }
          },
          direction: FlipDirection.HORIZONTAL,
          controller: flop,
          front: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'Front',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          back: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          count = 0;
          await flop.toggleCard();
          // await flipCard();
          // await flipCard();
        },
        child: const Icon(Icons.flip),
      ),
    );
  }
}

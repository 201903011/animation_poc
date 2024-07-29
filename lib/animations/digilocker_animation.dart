import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DigilockerAnimation extends StatelessWidget {
  const DigilockerAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digilocker Animation"),
      ),
      body: Center(
        child: Lottie.asset(
          "assets/files/glow_effect.json",
          repeat: true,
        ),
      ),
    );
  }
}

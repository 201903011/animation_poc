import 'package:animation/animations/curtain_animation.dart';
import 'package:animation/animations/custom_card.dart';
import 'package:animation/animations/digilocker_animation.dart';
import 'package:animation/animations/flutter_swiper.dart';
import 'package:animation/animations/orbit_animation.dart';
import 'package:animation/animations/vibration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations Example"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildButtonMenu(context, OrbitAnimation(), "Moon Animation"),
            buildButtonMenu(
                context, const DigilockerAnimation(), "Digilocker Animation"),
            buildButtonMenu(
                context, CurtainAnimation(), "Curtain drop Animation"),
            buildButtonMenu(context, FlutterSwiper(), "Swiper Animation"),
            buildButtonMenu(context, CustomCard(), "Custom Card Animation"),
            buildButtonMenu(context, VibrationScreen(), "Vibration screen"),
            buildButtonMenu(context, Scaffold(), "Flip Animation"),
          ],
        ),
      ),
    );
  }
}

Widget buildButtonMenu(BuildContext context, Widget page, String title) {
  return Column(
    children: [
      ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ));
        },
        child: Text(title),
      ),
      const SizedBox(height: 10),
    ],
  );
}

import 'package:flutter/material.dart';

class OuterCircle extends StatelessWidget {
  const OuterCircle({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
        ),
        Center(
          child: Container(
            width: width - 10,
            height: width - 10,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffF8F8F8).withOpacity(0.25),
              ),
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }
}

class InnerCircle extends StatelessWidget {
  const InnerCircle({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 80 + 60,
        ),
        Center(
          child: Container(
            width: width - 120,
            height: width - 120,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffF8F8F8).withOpacity(0.25),
              ),
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }
}

Widget innerShaddow(double width) {
  return Container(
    width: width,
    height: width + 80,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          Color(0xff141414).withOpacity(0),
          Color(0xff141414).withOpacity(0.87),
          Color(0xff141414).withOpacity(1),
          Color(0xff141414).withOpacity(1),
        ])),
  );
}

Widget outerShaddow(double width) {
  return Container(
    width: width,
    height: width + 80,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          Color(0xff141414).withOpacity(0),
          Color(0xff141414).withOpacity(0.85),
          Color(0xff141414).withOpacity(1),
          Color(0xff141414).withOpacity(1),
        ])),
  );
}

Widget starsObject(double width) {
  return Container(
    width: width * 0.83,
    height: width * 0.68,
    color: Colors.blue.withOpacity(0.0),
    child: Stack(
      children: [
        Positioned(
          left: 70,
          bottom: 40,
          child: StarCommonWidget(isBlink: true),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 50,
          child: StarCommonWidget(isBlink: true),
        ),
        Positioned(
          left: 10,
          right: 0,
          bottom: (width * 0.68) / 2,
          // top: 0,
          child: StarCommonWidget(isBlink: true),
        ),
        Positioned(
          right: 0,
          left: 90,
          top: 10,
          child: StarCommonWidget(isBlink: true),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 10,
          child: StarCommonWidget(isBlink: true),
        ),
        Positioned(
          bottom: 60,
          top: 0,
          left: 80,
          child: StarCommonWidget(isBlink: false),
        ),
        Positioned(
          bottom: 0,
          top: 0,
          right: 100,
          child: StarCommonWidget(isBlink: false),
        ),
        Positioned(
          bottom: 60,
          top: 20,
          child: StarCommonWidget(isBlink: false),
        ),
        Positioned(
          // bottom: 0,
          right: 60,
          top: 0,
          child: StarCommonWidget(isBlink: false),
        ),
        Positioned(
          bottom: 0,
          top: 60,
          child: StarCommonWidget(isBlink: false),
        ),
        Positioned(
          right: 40,
          bottom: 40,
          child: StarCommonWidget(isBlink: false),
        ),
        Positioned(
          left: 40,
          right: 0,
          top: 100,
          child: StarCommonWidget(isBlink: false),
        ),
        Positioned(
          right: 140,
          top: 70,
          left: 10,
          child: StarCommonWidget(isBlink: false),
        ),
        Positioned(
          bottom: 40,
          left: 60,
          top: 90,
          child: StarCommonWidget(isBlink: false),
        ),
      ],
    ),
  );
}

class StarCommonWidget extends StatefulWidget {
  final bool isBlink;
  const StarCommonWidget({super.key, required this.isBlink});

  @override
  State<StarCommonWidget> createState() => StarCommonWidgetState();
}

class StarCommonWidgetState extends State<StarCommonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: widget.isBlink
          ? BoxDecoration(
              color: widget.isBlink
                  ? Color(0xffFDEFE7).withOpacity(0.4)
                  : Colors.transparent,
              gradient: RadialGradient(colors: [
                Color(0xffFDEFE7).withOpacity(0.4),
                Color(0xffFDEFE7).withOpacity(0.2),
                Color(0xffFDEFE7).withOpacity(0.1),
                Color(0xffFDEFE7).withOpacity(0.0),
              ]))
          : null,
      child: Center(
        child: Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                Color(0xffFDEFE7).withOpacity(0.8),
                Color(0xffFDEFE7).withOpacity(0.6),
                Color(0xffFDEFE7).withOpacity(0.5),
                Color(0xffFDEFE7).withOpacity(0.4),
                Color(0xffFDEFE7).withOpacity(0.2),
                Color(0xffFDEFE7).withOpacity(0.1),
                Color(0xffFDEFE7).withOpacity(0.1),
                Color(0xffFDEFE7).withOpacity(0.1),
                Color(0xffFDEFE7).withOpacity(0.1),
              ])),
        ),
      ),
    );
  }
}

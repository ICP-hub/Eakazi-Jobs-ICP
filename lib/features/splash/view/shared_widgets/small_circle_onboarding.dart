import 'package:flutter/material.dart';

class SmallCirclesOnBoarding extends StatelessWidget {
  const SmallCirclesOnBoarding({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmallCircle(index: 1, currentIndex: currentIndex),
        SmallCircle(index: 2, currentIndex: currentIndex),
        SmallCircle(index: 3, currentIndex: currentIndex),
        SmallCircle(index: 4, currentIndex: currentIndex),
      ],
    );
  }
}

class SmallCircle extends StatelessWidget {
  const SmallCircle({
    Key? key,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);

  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: index == currentIndex
          ? Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2)),
            )
          : Container(
              height: 4,
              width: 4.17,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
    );
  }
}

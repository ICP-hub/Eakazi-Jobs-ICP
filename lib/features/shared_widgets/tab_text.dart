import 'package:flutter/material.dart';

import '../../constants/theme/color_selection.dart';

class TabText extends StatelessWidget {
  const TabText({
    Key? key,
    this.width,
    this.left,
    required this.tittle,
    required this.isNotify,
  }) : super(key: key);

  final double? width;
  final double? left;
  final String tittle;
  final bool isNotify;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: width,
      child: Stack(
        children: [
          Text(tittle),
          isNotify
              ? Positioned(
                  left: left,
                  child: const CircleAvatar(
                    backgroundColor: ColorsConst.secoundary,
                    radius: 5,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

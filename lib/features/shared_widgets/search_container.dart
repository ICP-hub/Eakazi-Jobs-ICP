import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/theme/color_selection.dart';
import '../../helpers/utils/utils.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 26),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 47,
      width: 100.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: ColorsConst.blackFour,
          )),
      child: Row(
        children: [
          Flexible( // Wrap the Text widget with Flexible
            child: Text(
              "e.g Game development jobs.............",
              style: textTheme(context).overline,
              overflow: TextOverflow.ellipsis, // Handle text overflow
            ),
          ),
          const Spacer(),
          const Icon(Icons.search, color: ColorsConst.blackFour)
        ],
      ),
    );
  }
}

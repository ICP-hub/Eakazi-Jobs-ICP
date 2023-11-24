import 'package:flutter/material.dart';

import '../../../constants/theme/color_selection.dart';
import '../../../helpers/utils/utils.dart';
import '../../shared_widgets/svgs.dart';

class MediaContaier extends StatelessWidget {
  const MediaContaier({
    Key? key,
    required this.tittle,
    required this.icon,
  }) : super(key: key);

  final String tittle;

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 26, right: 11),
      padding: const EdgeInsets.all(8),
      height: 40,
      // width: 97,
      decoration: BoxDecoration(
        color: ColorsConst.white,
        border: Border.all(color: ColorsConst.primary.withOpacity(0.08)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgIcon(icon),
          // const Spacer(),s
          const SizedBox(
            width: 8,
          ),
          Text(
            tittle,
            //   "Skill Acquisition",
            style: textTheme(context).headline5?.copyWith(
                color: ColorsConst.blackTwo.withOpacity(0.8),
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

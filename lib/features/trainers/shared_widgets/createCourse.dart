import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/theme/color_selection.dart';
import '../../../helpers/utils/utils.dart';
import '../../shared_widgets/svgs.dart';

class CreateCourseContainer extends StatelessWidget {
  const CreateCourseContainer({
    Key? key,
    required this.tittle,
    required this.subTittle,
    required this.icon,
  }) : super(key: key);

  final String tittle;
  final String subTittle;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 26),
      padding: const EdgeInsets.all(26),
      height: 126,
      width: 92.w,
      decoration: BoxDecoration(
        color: ColorsConst.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            // mainAxisAlignment: ,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tittle,
                //   "Skill Acquisition",
                style: textTheme(context).headline5,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subTittle,
                // "Click here to get started",
                style: textTheme(context)
                    .bodyText1
                    ?.copyWith(color: ColorsConst.secoundary.withOpacity(0.5)),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 32,
            child: SvgIcon(icon), //IconsAssets.skillAquasition),
            backgroundColor: colorScheme(context).primary.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}

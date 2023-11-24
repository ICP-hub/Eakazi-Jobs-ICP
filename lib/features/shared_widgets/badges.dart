import 'package:badges/badges.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:flutter/material.dart';

import '../../helpers/utils/utils.dart';

class ChatBadges extends StatelessWidget {
  const ChatBadges({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      showBadge: true,
      animationType: BadgeAnimationType.scale,
      badgeColor: ColorsConst.badgeColor.withOpacity(0.2),
      // stackFit: StackFit.passthrough,
      // position: BadgePosition.topEnd(top: -7, end: -5),
      badgeContent: Text(
        "2",
        style: textTheme(context)
            .bodyText2
            ?.copyWith(color: ColorsConst.badgeColor),
      ),
      child: SizedBox(
        height: 1,
        width: 1,
      ),
    );
  }
}

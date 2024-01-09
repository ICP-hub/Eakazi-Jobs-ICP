import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/assets/icon_constans.dart';
import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../shared_widgets/svgs.dart';

class CurrentBalanceWalletContainer extends StatelessWidget {
  const CurrentBalanceWalletContainer({
    Key? key,
    required this.text,
    required this.subText,
  }) : super(key: key);
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      width: 100.w,
      // alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 21, right: 10),
      // margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: ColorsConst.profileContainer.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: textTheme(context).bodyText1?.copyWith(
                // color: color,
                fontSize: 20),
          ),
          Text(
            subText,
            style: textTheme(context).bodyText2?.copyWith(
                color: ColorsConst.tittleColor, fontSize: 10, letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}

class DepoWalletCont extends StatelessWidget {
  const DepoWalletCont({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // margin:
          // margin: const EdgeInsets.only(right: 37),
          height: 62.64,
          width: 65,
          decoration: const BoxDecoration(
            color: ColorsConst.containeravatarColor,
            shape: BoxShape.circle,
          ),
          child: const Center(child: const SvgIcon(IconsAssets.depoWallet)),
        ),
        const SizedBox(
          height: 9,
        ),
        Center(
          child: Text(
            text,
            style: textTheme(context)
                .subtitle1
                ?.copyWith(fontSize: 14, color: Colors.black),
          ),
        )
      ],
    );
  }
}

class WalletTileContainer extends StatelessWidget {
  const WalletTileContainer({
    Key? key,
    required this.text,
    required this.subText,
  }) : super(key: key);
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100.w,
      // alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 21, right: 10),
      // margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: ColorsConst.white,
        boxShadow: [
          BoxShadow(
              color: ColorsConst.badgeColor.withOpacity(0.17),
              blurRadius: 6,
              offset: const Offset(0, 3))
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Material(
            shape: CircleBorder(),
            elevation: 2,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white,
              child: SvgIcon(IconsAssets.sideArrow),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: textTheme(context).bodyText1?.copyWith(
                    // color: color,
                    fontSize: 16),
              ),
              Text(
                subText,
                style: textTheme(context).bodyText2?.copyWith(
                    color: ColorsConst.tittleColor,
                    fontSize: 12,
                    letterSpacing: 1),
              ),
            ],
          ),
          const Spacer(),
          Text(
            "N 5,000",
            style: textTheme(context)
                .bodyText1
                ?.copyWith(color: ColorsConst.green, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

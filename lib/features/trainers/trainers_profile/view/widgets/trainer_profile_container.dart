import 'package:eakazijobs/constants/assets/images_constants.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:flutter/material.dart';

import '../../../../../helpers/utils/utils.dart';

class ColoredProfileText extends StatelessWidget {
  const ColoredProfileText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      // width: 88,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color.withOpacity(0.1)),
      child: Text(
        text,
        style: textTheme(context).subtitle1?.copyWith(
              color: color,
            ),
      ),
    );
  }
}

class OverviewContainer extends StatelessWidget {
  const OverviewContainer({
    Key? key,
    required this.text,
    required this.subText,
  }) : super(key: key);
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: 162,
      // alignment: Alignment.center,
      padding: EdgeInsets.only(left: 15, right: 10),
      margin: EdgeInsets.only(right: 6),
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

class PortfolioProjectsContainer extends StatelessWidget {
  const PortfolioProjectsContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 183,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(image))),
    );
  }
}

class NftCertificates extends StatelessWidget {
  const NftCertificates({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 183,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsConst.secoundary,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    "EA KAZI NFT CERTIFICATE",
                    style: textTheme(context).headline4?.copyWith(
                        color: ColorsConst.white,
                        fontSize: 15,
                        letterSpacing: 1),
                  ),
                ),
                Text(
                  "Ui/ux design fundamental",
                  style: textTheme(context).bodyText2?.copyWith(
                      color: ColorsConst.white, fontSize: 10, letterSpacing: 1),
                ),
              ],
            ),
          ),
          Material(
            shape: CircleBorder(),
            elevation: 0.5,
            child: CircleAvatar(
              radius: 24,
              //IconsAssets.skillAquasition),
              backgroundColor: ColorsConst.white,
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child:
                      Image.asset(ImageAssets.jelurida) //ImageAssets.google),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:eakazijobs/constants/assets/images_constants.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/features/shared_widgets/linear_percenth_indicator.dart';
import 'package:eakazijobs/features/shared_widgets/svgs.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';

import '../../../../constants/assets/icon_constans.dart';
import '../../shared_widgets/media_container.dart';
import '../../shared_widgets/reconmended_tile.dart';
import '../../shared_widgets/skill_container.dart';
import 'package:eakazijobs/models/signupModel.dart';

SignupModel signupModel = SignupModel();

class FreeLancerCourses extends StatelessWidget {
  const FreeLancerCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Hi, ${signupModel.fullName}",
                        style: textTheme(context).headline3,
                      ),
                      const Spacer(),
                      Material(
                        borderRadius: BorderRadius.circular(50),
                        elevation: 2,
                        shadowColor: ColorsConst.black.withOpacity(0.2),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          height: 14,
                          width: 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const SvgIcon(IconsAssets.navhori),
                        ),
                      )
                    ],
                  ),
                  Container(
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
                        Flexible(
                          child: Text(
                            "e.g Game development jobs.............",
                            style: textTheme(context).overline,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.search, color: ColorsConst.blackFour)
                      ],
                    ),
                  ),
                  const MediaListWidget(),
                  ReconmendedListwidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReconmendedListwidget extends StatelessWidget {
  const ReconmendedListwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26, right: 0),
      child: ListView(
        shrinkWrap: true,
        children: [
          ReconmendedTile(
            image: ImageAssets.jelurida,
            tittle: "JelaAfrica",
            subTittle2: "Intermidates",
            mainTittle: "Visual Designer Course",
            extraWidget: Text(
              "Free",
              //   "Skill Acquisition",
              style: textTheme(context).caption,
            ),
          ),
          ReconmendedTile(
            image: ImageAssets.jelurida,
            tittle: "JelaAfrica",
            subTittle2: "In progress",
            mainTittle: "Visual Designer Course",
            extraWidget: Column(
              children: [
                Text(
                  "60% Completed",
                  //   "Skill Acquisition",
                  style: textTheme(context).caption,
                ),
                SizedBox(
                  height: 3,
                ),
                LinerPercentIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Reconmmended extends StatelessWidget {
  const Reconmmended({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        children: [
          Text("Recommended",
              //   "Skill Acquisition",
              style: textTheme(context).headline4),
          const Spacer(),
          Text("See All",
              //   "Skill Acquisition",
              style: textTheme(context).headline4),
        ],
      ),
    );
  }
}

class MediaListWidget extends StatelessWidget {
  const MediaListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          MediaContaier(icon: IconsAssets.media, tittle: "Media"),
          MediaContaier(icon: IconsAssets.design, tittle: "Design"),
          MediaContaier(icon: IconsAssets.devOpps, tittle: "DevOps"),
        ],
      ),
    );
  }
}

class SkillAquiListOne extends StatelessWidget {
  const SkillAquiListOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 134,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          SkillContainer(
            tittle: "Skill Acquisition",
            subTittle: "Click here to get started",
            icon: IconsAssets.skillAquasition,
          ),
          SizedBox(
            width: 17,
          ),
          SkillContainer(
            tittle: "Bid For Jobs",
            subTittle: "Click here to get started",
            icon: IconsAssets.briefcase,
          ),
        ],
      ),
    );
  }
}

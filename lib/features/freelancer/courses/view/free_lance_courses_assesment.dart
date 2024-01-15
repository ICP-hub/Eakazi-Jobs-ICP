import 'package:eakazijobs/constants/assets/images_constants.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/features/shared_widgets/buttons.dart';
import 'package:eakazijobs/features/shared_widgets/linear_percenth_indicator.dart';
import 'package:eakazijobs/features/shared_widgets/svgs.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/assets/icon_constans.dart';
import '../../../../helpers/routes/app_pages.dart';
import '../../shared_widgets/media_container.dart';
import '../../shared_widgets/reconmended_tile.dart';
import '../../shared_widgets/skill_container.dart';

class FreeLancerCoursesAssesment extends StatelessWidget {
  const FreeLancerCoursesAssesment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Courses"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       // InkWell(
            //       //   onTap: () {
            //       //     Get.toNamed(Routes.flProfilePublic);
            //       //   },
            //         // child: Row(
            //         //   children: [
            //         //     Material(
            //         //       shape: CircleBorder(),
            //         //       elevation: 5,
            //         //       child: CircleAvatar(
            //         //         radius: 24,
            //         //         //IconsAssets.skillAquasition),
            //         //         backgroundColor: ColorsConst.white,
            //         //         child: Padding(
            //         //             padding: const EdgeInsets.all(12),
            //         //             child: Image.asset(
            //         //                 ImageAssets.jelurida) //ImageAssets.google),
            //         //             ),
            //         //       ),
            //         //     ),
            //         //     // SizedBox(
            //         //     //   width: 19,
            //         //     // ),
            //         //     // Column(
            //         //     //   crossAxisAlignment: CrossAxisAlignment.start,
            //         //     //   children: [
            //         //     //     Text(
            //         //     //       "Jelafrica",
            //         //     //       //   "Skill Acquisition",
            //         //     //       style: textTheme(context)
            //         //     //           .headline4
            //         //     //           ?.copyWith(fontSize: 15),
            //         //     //     ),
            //         //     //     Text(
            //         //     //       "Tutor",
            //         //     //       //   "Skill Acquisition",
            //         //     //       style: textTheme(context)
            //         //     //           .caption
            //         //     //           ?.copyWith(fontSize: 15),
            //         //     //     ),
            //         //     //   ],
            //         //     // ),
            //         //   ],
            //         // ),
            //       // ),
            //       ReconmendedListwidget(),
            //     ],
            //   ),
            // ),
              ReconmendedListwidget(),
            // Spacer(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            //   child: AuthBtn(
            //       text: "Take course", isComplete: true, onPressed: () {}),
            // ),
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
            tittle: "Anony",
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

// class Reconmmended extends StatelessWidget {
//   const Reconmmended({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 30),
//       child: Row(
//         children: [
//           Text("Recommended",
//               //   "Skill Acquisition",
//               style: textTheme(context).headline4),
//           const Spacer(),
//           Text("See All",
//               //   "Skill Acquisition",
//               style: textTheme(context).headline4),
//         ],
//       ),
//     );
//   }
// }

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

// class SkillAquiListOne extends StatelessWidget {
//   const SkillAquiListOne({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 134,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: const [
//           SkillContainer(
//             tittle: "Skill Acquisition",
//             subTittle: "Click here to get started",
//             icon: IconsAssets.skillAquasition,
//           ),
//           SizedBox(
//             width: 17,
//           ),
//           SkillContainer(
//             tittle: "Bid For Jobs",
//             subTittle: "Click here to get started",
//             icon: IconsAssets.briefcase,
//           ),
//         ],
//       ),
//     );
//   }
// }

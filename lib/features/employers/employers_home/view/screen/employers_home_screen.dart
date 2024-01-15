import 'package:eakazijobs/constants/assets/images_constants.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/features/shared_widgets/svgs.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:eakazijobs/services/getStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';

import '../../../../../constants/assets/icon_constans.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../shared_widgets/search_container.dart';
import '../../../../freelancer/courses/view/free_lance_courses.dart';
import '../../../../freelancer/shared_widgets/media_container.dart';
import '../../../../freelancer/shared_widgets/reconmended_tile.dart';
import '../../../../freelancer/shared_widgets/skill_container.dart';
import '../widgets/data_employer_jobs.dart';
import '../widgets/no_data_jobs.dart';
import 'package:eakazijobs/models/signupModel.dart';

SignupModel signupModel = SignupModel();

class EmployersHomeScreen extends StatelessWidget {
  const EmployersHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    return Scaffold(
      // appBar: AppBar(),
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
                  const SearchContainer(),
                  const SkillAquiListOne(),
                  const MediaListWidget(),
                  const Reconmmended(),
                  // use {../NoDataEmployers for empty data }
                  // const JobsEmployesrWidgte(),
                  const NoDataEmployers(),
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
          const ReconmendedTile(image: ImageAssets.google, tittle: "Googke"),
          const ReconmendedTile(
              image: ImageAssets.visualDesigner, tittle: "Googke"),
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
          Text("Published Jobs",
              //   "Skill Acquisition",
              style: textTheme(context).headline4),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.fLJobs);
            },
            child: Text("See All",
                //   "Skill Acquisition",
                style: textTheme(context).headline4),
          ),
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
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.freeLancerCoursers);
            },
            child: const SkillContainer(
              tittle: "Skill Acquisition",
              subTittle: "Click here to get started",
              icon: IconsAssets.skillAquasition,
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          const SkillContainer(
            tittle: "Bid For Jobs",
            subTittle: "Click here to get started",
            icon: IconsAssets.briefcase,
          ),
        ],
      ),
    );
  }
}

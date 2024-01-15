import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../helpers/routes/app_pages.dart';

import '../../../../../constants/assets/images_constants.dart';
import '../../../../freelancer/shared_widgets/reconmended_tile.dart';
import '../../../../shared_widgets/linear_percenth_indicator.dart';
import '../../../trainers_home/view/widgets/data_trainers_jobs.dart';
import '../widgets/trainer_profile_container.dart';

class TrannerProfileProfile extends StatelessWidget {
  const TrannerProfileProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: const AssetImage(ImageAssets.avatar),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Marvelous IK",
                        style: textTheme(context).subtitle2?.copyWith(
                            color: ColorsConst.tittleColor, fontSize: 20),
                      ),
                      Text(
                        "UI/UX Designer",
                        style: textTheme(context).bodyText2?.copyWith(
                              color: ColorsConst.tittleColor.withOpacity(0.6),
                            ),
                      ),
                      Text(
                        "Edit profile",
                        style: textTheme(context).caption?.copyWith(
                              color: ColorsConst.tittleColor,
                            ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Overview",
                style: textTheme(context).bodyText1?.copyWith(
                      color: ColorsConst.tittleColor2,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    OverviewContainer(
                      text: "0",
                      subText: "Courses Created",
                    ),
                    OverviewContainer(
                      text: "0",
                      subText: "Students",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    OverviewContainer(
                      text: "0",
                      subText: "Commision(\$)",
                    ),
                    OverviewContainer(
                      text: "0",
                      subText: "Certificates Issued",
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 24,
              // ),
              Padding(
                padding: const EdgeInsets.only(right: 36.0, left: 4),
                child : Column (
                  children: [
                    const Reconmmended(),
                    const SizedBox(
                      height: 12,
                    ),
                    const JobsTrainersWidgte(),
                  ],
                )
              ),

              // Text(
              //   "Registered Courses",
              //   style: textTheme(context).bodyText1?.copyWith(
              //         color: ColorsConst.tittleColor2,
              //       ),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 16),
              //   child: ReconmendedTile(
              //     image: ImageAssets.jelurida,
              //     tittle: "JelaAfrica",
              //     subTittle2: "In progress",
              //     mainTittle: "Visual Designer Course",
              //     extraWidget: Column(
              //       children: [
              //         Text(
              //           "60% Completed",
              //           //   "Skill Acquisition",
              //           style: textTheme(context).caption,
              //         ),
              //         SizedBox(
              //           height: 3,
              //         ),
              //         LinerPercentIndicator(),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
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
          Text("Published Courses",
              //   "Skill Acquisition",
              style: textTheme(context).headline4),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.freeLancerCoursers);
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
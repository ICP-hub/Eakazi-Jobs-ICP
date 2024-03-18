import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/assets/icon_constans.dart';
import '../../../../../constants/assets/images_constants.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../../integrations.dart';
import '../../../../authentication/login/view/screen/sign_in.dart' as SignIn;
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/linear_percenth_indicator.dart';
import '../../../../shared_widgets/svgs.dart';
import '../../../shared_widgets/reconmended_tile.dart';
import '../widgets/profile_container.dart';

class FreeLanceProfilePublic extends StatelessWidget {
  const FreeLanceProfilePublic({super.key});

  Future<int> countJobsApplied() async {
    var countJobsApplied = await SignIn.newActor!
        .getFunc(FieldsMethod.getJobsAppliedCount)
        ?.call([]);
    print(countJobsApplied);
    return countJobsApplied;
  }

  Future<List<dynamic>> getRegisteredCourses() async {
    var registeredCourses = await SignIn.newActor!
        .getFunc(FieldsMethod.getCoursesRegisteredByUser)
        ?.call([]);
    print(registeredCourses);
    return registeredCourses;
  }

  @override
  Widget build(BuildContext context) {
    final name = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.flChatList);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: const SvgIcon(IconsAssets.chatIcon),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: const AssetImage(ImageAssets.studentImage),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name ?? "Marvelous IK",
                        style: textTheme(context).subtitle2?.copyWith(
                            color: ColorsConst.tittleColor, fontSize: 20),
                      ),
                      Text(
                        "UI/UX Designer",
                        style: textTheme(context).bodyText2?.copyWith(
                              color: ColorsConst.tittleColor.withOpacity(0.6),
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 36,
                            width: 75,
                            child: AuthBtnBorder(
                                text: "Contact",
                                isComplete: true,
                                onPressed: () {
                                  Get.toNamed(Routes.flChatList);
                                }),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          SizedBox(
                            height: 36,
                            width: 75,
                            child: AuthBtn(
                                textStyle: textTheme(context)
                                    .caption
                                    ?.copyWith(color: ColorsConst.white),
                                borderRadius: BorderRadius.circular(0.3),
                                text: "Hire",
                                isComplete: true,
                                onPressed: () {}),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Skills",
                style: textTheme(context).bodyText1?.copyWith(
                      color: ColorsConst.tittleColor2,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ColoredProfileText(
                      text: "UI/UX",
                      color: ColorsConst.darkGreen,
                    ),
                    ColoredProfileText(
                      text: "Front - End Dev",
                      color: ColorsConst.darkGreen,
                    ),
                    ColoredProfileText(
                      text: "Figma",
                      color: ColorsConst.darkGreen,
                    ),
                    ColoredProfileText(
                      text: "Adobe XD",
                      color: ColorsConst.pink,
                    ),
                  ],
                ),
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
                  children: [
                    OverviewContainer(
                      text: "0",
                      subText: "Certifications",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FutureBuilder<int>(
                      future: countJobsApplied(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text(
                            'Loading...', // You can replace this with a more appropriate loading message
                            style: textTheme(context).bodyText2?.copyWith(
                                  color: ColorsConst.tittleColor,
                                ),
                          );
                        } else if (snapshot.hasError) {
                          return Text(
                            'Error: ${snapshot.error}',
                            style: textTheme(context).bodyText2?.copyWith(
                                  color: ColorsConst.tittleColor,
                                ),
                          );
                        } else if (snapshot.hasData) {
                          // Use snapshot.data which is of type int
                          return OverviewContainer(
                            text: snapshot.data
                                .toString(), // Convert the int to String
                            subText: "Jobs Applied",
                          );
                        } else {
                          // Handle the case when there's no data
                          return Text(
                            "0",
                            style: textTheme(context).bodyText2?.copyWith(
                                  color: ColorsConst.tittleColor,
                                ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Portfolio projects",
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
                  children: [
                    PortfolioProjectsContainer(
                      image: ImageAssets.profilePic2,
                    ),
                    PortfolioProjectsContainer(
                      image: ImageAssets.profilePic1,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Portfolio projects",
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
                  children: [
                    NftCertificates(
                      courseName: "Name",
                      courseCreator: "Creator",
                      image: ImageAssets.profilePic2,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Registered Courses",
                style: textTheme(context).bodyText1?.copyWith(
                      color: ColorsConst.tittleColor2,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ReconmendedTile(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

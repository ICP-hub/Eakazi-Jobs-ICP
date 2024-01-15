import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';
import '../../../../../constants/assets/images_constants.dart';
import '../../../../shared_widgets/linear_percenth_indicator.dart';
import '../../../shared_widgets/reconmended_tile.dart';
import '../widgets/profile_container.dart';
import 'package:eakazijobs/models/signupModel.dart';

SignupModel signupModel = SignupModel();

class FreeLanceProfile extends StatelessWidget {
  const FreeLanceProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 10),
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
                        "null",
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
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    OverviewContainer(
                      text: "N20,600",
                      subText: "Current balance",
                    ),
                    OverviewContainer(
                      text: "58",
                      subText: "Jobs Applied",
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

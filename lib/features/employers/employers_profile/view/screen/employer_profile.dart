import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../helpers/routes/app_pages.dart';

import '../../../../../constants/assets/images_constants.dart';
import '../../../../freelancer/shared_widgets/reconmended_tile.dart';
import '../../../../shared_widgets/linear_percenth_indicator.dart';
import '../../../employers_home/view/widgets/data_employer_jobs.dart';
import '../widgets/employer_profile_container.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';
import 'package:eakazijobs/integrations.dart';

class EmployerProfileProfile extends StatelessWidget {
  const EmployerProfileProfile({super.key});

  Future<String> getName() async {
    var fullName =
    await newActor!.getFunc(FieldsMethod.getFullName)?.call([]);
    return fullName;
  }

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
                      FutureBuilder<String>(
                        future: getName(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Text(
                              snapshot.data ?? "User",
                              style: textTheme(context).subtitle2?.copyWith(
                                  color: ColorsConst.tittleColor, fontSize: 20),
                            );
                          }
                        },
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
                      subText: "Jobs Created",
                    ),
                    OverviewContainer(
                      text: "0",
                      subText: "Freelancers Employed",
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
                      subText: "Balance (\$)",
                    ),
                    OverviewContainer(
                      text: "0",
                      subText: "Rating",
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
                    const ReconmendedListwidget(),
                  ],
                )
              ),
            ],
          ),
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
      padding: const EdgeInsets.only(top: 0, right: 0),
      child: ListView(
        shrinkWrap: true,
        children: [
          const ReconmendedTileJobs(image: ImageAssets.icpLogo, tittle: "Googke"),
          const ReconmendedTileJobs(
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
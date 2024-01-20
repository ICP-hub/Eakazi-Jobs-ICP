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
import '../../../../trainers/trainers_home/view/screen/trainer_courses.dart';
import '../../../../freelancer/shared_widgets/media_container.dart';
import '../../../../employers/shared_widgets/reconmended_tile.dart';
import '../../../../freelancer/shared_widgets/skill_container.dart';
import '../widgets/data_employer_jobs.dart';
import '../widgets/no_data_jobs.dart';
import 'package:eakazijobs/models/signupModel.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';
import 'package:eakazijobs/integrations.dart';

SignupModel signupModel = SignupModel();

class EmployersHomeScreen extends StatelessWidget {
  const EmployersHomeScreen({Key? key}) : super(key: key);

  Future<String> getName() async {
    var fullName = await newActor!.getFunc(FieldsMethod.getFullName)?.call([]);
    return fullName;
  }

  Future<void> jobCreator() async {
    try {
      var jobByCreator =
          await newActor!.getFunc(FieldsMethod.getJobsByCreator)?.call([]);
      print(jobByCreator);
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    jobCreator();
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
                  FutureBuilder<String>(
                    future: getName(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Row(
                          children: [
                            Flexible(
                              child: Text(
                                "Hi, ${snapshot.data}",
                                style: textTheme(context).headline3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                            Material(
                              borderRadius: BorderRadius.circular(50),
                              elevation: 2,
                              shadowColor: ColorsConst.black.withOpacity(0.2),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
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
                        );
                      }
                    },
                  ),
                  const SearchContainer(),
                  const SkillAquiListOne(),
                  const MediaListWidget(),
                  const Reconmmended(),
                  const ReconmendedListwidget(),
                  // const NoDataEmployers(),
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

  Future<List<dynamic>> jobsCreatorList() async {
    try {
      var jobs =
          await newActor!.getFunc(FieldsMethod.getJobsByCreator)?.call([]);
      print(jobs);
      return jobs;
    } catch (e) {
      print('Error fetching courses: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 0),
      child: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            FutureBuilder<List<dynamic>>(
              future: jobsCreatorList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data!.isNotEmpty) {
                  var jobsToShow = snapshot.data!.take(3).toList();
                  return Column(
                    children: jobsToShow.map((jobs) {
                      return ReconmendedTileJobs(
                          tittle: "${jobs['title']} skills required",
                          image: ImageAssets.icpLogo,
                          mainTittle: jobs['title']);
                    }).toList(),
                  );
                } else if (snapshot.connectionState !=
                    ConnectionState.waiting) {
                  return NoDataEmployers();
                } else {
                  return Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
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
          Text("Published Jobs",
              //   "Skill Acquisition",
              style: textTheme(context).headline4),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.employerJobs);
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
              Get.toNamed(Routes.empPostJoBScreen);
            },
            child: const SkillContainer(
              tittle: "Post a Job",
              subTittle: "Click here to post a job",
              icon: IconsAssets.skillAquasition,
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          const SkillContainer(
            tittle: "Hire a Freelancer",
            subTittle: "Browse Freelancers",
            icon: IconsAssets.briefcase,
          ),
        ],
      ),
    );
  }
}

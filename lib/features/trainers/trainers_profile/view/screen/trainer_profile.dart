import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../helpers/routes/app_pages.dart';

import '../../../../../constants/assets/images_constants.dart';
import '../../../trainers_home/view/widgets/data_trainers_jobs.dart';
import '../widgets/trainer_profile_container.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';
import 'package:eakazijobs/integrations.dart';

import 'package:eakazijobs/features/trainers/trainers_home/view/widgets/no_data_jobs_trainers.dart';

class TrannerProfileProfile extends StatelessWidget {
  const TrannerProfileProfile({super.key});

  Future<String> getName() async {
    var fullName = await newActor!.getFunc(FieldsMethod.getFullName)?.call([]);
    return fullName;
  }

  Future<List<dynamic>> courseCreatorList() async {
    try {
      var courses =
          await newActor!.getFunc(FieldsMethod.getCourseByCreator)?.call([]);
      print(courses);
      return courses; // Assuming courses is a List<Course>
    } catch (e) {
      print('Error fetching courses: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, top: 10),
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
                        "Edit profile",
                        style: textTheme(context).caption?.copyWith(
                              color: ColorsConst.tittleColor,
                              decoration: TextDecoration.underline,
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
                  children: [
                    FutureBuilder<List<dynamic>>(
                      future: courseCreatorList(),
                      builder: (context, snapshot) {
                        int coursesCount = snapshot.data?.length ?? 0;
                        return OverviewContainer(
                          text: coursesCount.toString(),
                          subText: "Courses Created",
                        );
                      },
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
              Padding(
                  padding: const EdgeInsets.only(right: 36.0, left: 4),
                  child: Column(
                    children: [
                      const Reconmmended(),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        child: Column(children: [
                          ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              FutureBuilder<List<dynamic>>(
                                future: courseCreatorList(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      snapshot.hasData &&
                                      snapshot.data!.isNotEmpty) {
                                    var coursesToShow = snapshot.data!
                                        .take(3)
                                        .toList(); // Take only first three courses
                                    return Column(
                                      children: coursesToShow.map((course) {
                                        return JobsTrainersWidgte(
                                            title: course['title']);
                                      }).toList(),
                                    );
                                  } else if (snapshot.connectionState !=
                                      ConnectionState.waiting) {
                                    return NoTrainersEmployers();
                                  } else {
                                    return Center(
                                      child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth:
                                              2,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ]),
                      )
                    ],
                  )),
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
              Get.toNamed(Routes.trainerCoursers);
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

import 'package:eakazijobs/constants/assets/images_constants.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/features/shared_widgets/svgs.dart';
import 'package:eakazijobs/features/trainers/shared_widgets/createCourse.dart';
import 'package:eakazijobs/features/trainers/trainers_home/view/widgets/no_data_jobs_trainers.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/assets/icon_constans.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../shared_widgets/search_container.dart';
import 'trainer_courses.dart';
import '../../../../freelancer/shared_widgets/media_container.dart';
import '../../../../freelancer/shared_widgets/reconmended_tile.dart';
import '../../../../freelancer/shared_widgets/skill_container.dart';
import '../widgets/data_trainers_jobs.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';
import 'package:eakazijobs/integrations.dart';

class TrainerssHomeScreen extends StatelessWidget {
  const TrainerssHomeScreen({Key? key}) : super(key: key);

  Future<void> courseCreator() async {
    try {
      var course =
          await newActor!.getFunc(FieldsMethod.getCourseByCreator)?.call([]);
      print(course);
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }

  Future<String> getName() async {
    var fullName = await newActor!.getFunc(FieldsMethod.getFullName)?.call([]);
    return fullName;
  }

  @override
  Widget build(BuildContext context) {
    courseCreator();
    return Scaffold(
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

  Future<List<dynamic>> courseCreatorList() async {
    try {
      var courses =
          await newActor!.getFunc(FieldsMethod.getCourseByCreator)?.call([]);
      print(courses);
      return courses;
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
        child: Column(children: [
          ListView(
            shrinkWrap: true,
            children: [
              FutureBuilder<List<dynamic>>(
                future: courseCreatorList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      snapshot.data!.isNotEmpty) {
                    var coursesToShow = snapshot.data!.take(4).toList();
                    return Column(
                      children: coursesToShow.map(
                        (course) {
                          return JobsTrainersWidgte(
                              title: course['title'], id: course['id']);
                        },
                      ).toList(),
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
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ]),
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
              Get.toNamed(Routes.trainerCreateCourse);
            },
            child: const CreateCourseContainer(
              tittle: "Create a course",
              subTittle: "Click here to get started",
              icon: IconsAssets.skillAquasition,
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          const CreateCourseContainer(
              tittle: "Create a test",
              subTittle: "Click here to get started",
              icon: IconsAssets.briefcase)
        ],
      ),
    );
  }
}

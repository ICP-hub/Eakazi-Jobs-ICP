import 'package:eakazijobs/constants/assets/images_constants.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/features/shared_widgets/linear_percenth_indicator.dart';
import 'package:eakazijobs/features/shared_widgets/svgs.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';
import 'package:eakazijobs/integrations.dart';
import 'package:eakazijobs/features/trainers/shared_widgets/createCourse.dart';
import 'package:eakazijobs/features/trainers/trainers_home/view/widgets/no_data_jobs_trainers.dart';
import '../widgets/data_trainers_jobs.dart';

import '../../../../../constants/assets/icon_constans.dart';
import '../../../../freelancer/shared_widgets/media_container.dart';
import '../../../../freelancer/shared_widgets/reconmended_tile.dart';
import '../../../../freelancer/shared_widgets/skill_container.dart';
import 'package:eakazijobs/models/signupModel.dart';

SignupModel signupModel = SignupModel();

class TrainerCourses extends StatelessWidget {
  const TrainerCourses({Key? key}) : super(key: key);

  Future<List<dynamic>> courseCreatorList() async {
    try {
      var courses = await newActor!.getFunc(FieldsMethod.getCourseByCreator)?.call([]);
      print(courses);
      return courses ?? [];
    } catch (e) {
      print('Error fetching courses: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Published Courses"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 47,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: ColorsConst.blackFour,
                        ),
                      ),
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
                    SizedBox(height: 20.0),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 40, left: 16, right: 16),
                child: FutureBuilder<List<dynamic>>(
                  future: courseCreatorList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Column(
                        children: snapshot.data!.map((course) {
                          return JobsTrainersWidgte(tittle: course['title']);
                        }).toList(),
                      );
                    } else if (snapshot.connectionState != ConnectionState.waiting) {
                      return NoTrainersEmployers();
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              );
            }
          },
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
          Text("Recommended", style: textTheme(context).headline4),
          const Spacer(),
          Text("See All", style: textTheme(context).headline4),
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

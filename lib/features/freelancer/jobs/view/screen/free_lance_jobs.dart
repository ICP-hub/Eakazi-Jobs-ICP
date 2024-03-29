import 'package:eakazijobs/constants/assets/images_constants.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';
import 'package:eakazijobs/models/signupModel.dart';
import 'package:eakazijobs/integrations.dart';

import '../../../../../constants/assets/icon_constans.dart';
import '../../../shared_widgets/media_container.dart';
import '../../../shared_widgets/reconmended_tile.dart';
import '../../../shared_widgets/skill_container.dart';

SignupModel signupModel = SignupModel();

class FreeLancerJobs extends StatelessWidget {

  const FreeLancerJobs({Key? key}) : super(key: key);

  Future<List<dynamic>> getAllJobs() async {
    try {
      var allJobs =
      await newActor!.getFunc(FieldsMethod.getAllJobs)?.call([]);
      return allJobs ?? [];
    } catch (e) {
      print('Error fetching courses: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Jobs"),
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
                padding: const EdgeInsets.only(
                    top: 0, bottom: 40, left: 16, right: 16),
                child: FutureBuilder<List<dynamic>>(
                  future: getAllJobs(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Column(
                        children: snapshot.data!.map((jobs) {
                          return ReconmendedTileJobs(
                            image: ImageAssets.visualDesigner,
                            id: jobs['id'],
                            tittle: jobs['creator_fullname'],
                            mainTittle: jobs['title'],
                          );
                        }).toList(),
                      );
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
          ReconmendedTileJobs(
            image: ImageAssets.jelurida,
            tittle: "JelaAfrica",
            subTittle2: "Ui/Ux Design Certificate required",
            mainTittle: "UI/UX Designer",
            extraWidget: Text(
              "200,00",
              //   "Skill Acquisition",
              style: textTheme(context).caption,
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
          Text("Recommended",
              //   "Skill Acquisition",
              style: textTheme(context).headline4),
          const Spacer(),
          Text("See All",
              //   "Skill Acquisition",
              style: textTheme(context).headline4),
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

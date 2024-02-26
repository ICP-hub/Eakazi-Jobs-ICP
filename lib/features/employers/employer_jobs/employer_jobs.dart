import 'package:eakazijobs/constants/assets/images_constants.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';

import '../../../constants/assets/icon_constans.dart';
import '../../../integrations.dart';
import '../../freelancer/shared_widgets/media_container.dart';
import '../shared_widgets/reconmended_tile.dart';

class EmployerJobs extends StatelessWidget {
  const EmployerJobs({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Published Jobs"),
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
                  future: jobsCreatorList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Column(
                        children: snapshot.data!.map((jobs) {
                          return ReconmendedTileJobs(
                            tittle: "${jobs['title']} skills required",
                            image: ImageAssets.jobImage,
                            mainTittle: jobs['title'],
                            id: jobs['id'],
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

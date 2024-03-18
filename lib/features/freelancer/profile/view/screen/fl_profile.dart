import 'package:get/get.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';
import '../../../../../constants/assets/images_constants.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../shared_widgets/linear_percenth_indicator.dart';
import '../../../shared_widgets/reconmended_tile.dart';
import '../widgets/profile_container.dart';
import 'package:eakazijobs/models/signupModel.dart';
import 'package:eakazijobs/integrations.dart';


SignupModel signupModel = SignupModel();

class FreeLanceProfile extends StatelessWidget {
  const FreeLanceProfile({super.key});

  Future<String> getName() async {
    var fullName = await newActor!.getFunc(FieldsMethod.getFullName)?.call([]);
    return fullName;
  }

  Future<int> countJobsApplied() async {
    var countJobsApplied =
        await newActor!.getFunc(FieldsMethod.getJobsAppliedCount)?.call([]);
    print(countJobsApplied);
    return countJobsApplied;
  }

  Future<List<dynamic>> getRegisteredCourses() async {
    var registeredCourses = await newActor!
        .getFunc(FieldsMethod.getCoursesRegisteredByUser)
        ?.call([]);
    print(registeredCourses);
    return registeredCourses;
  }

  Future<List<Map<String, String>>> getCourseNamesIdsAndCreators() async {
    var selfData = await newActor!.getFunc(FieldsMethod.getSelf)?.call([]);
    print(selfData);

    var tokenIds = selfData['token_ids'] as List<List<dynamic>>?;
    List<Map<String, String>> coursesInfo = [];

    if (tokenIds != null && tokenIds.isNotEmpty) {
      for (var tokenPair in tokenIds) {
        String courseId = tokenPair[1];
        var course = await getCourse(courseId);
        coursesInfo.add({
          'id': courseId,
          'name': course['title'],
          'creator': course['creator_fullname'],
        });
      }
    }
    print("Courses Info: $coursesInfo");
    return coursesInfo;
  }

  Future<dynamic> getCourse(String id) async {
    var course = await newActor!.getFunc(FieldsMethod.getCourse)?.call([id]);
    return course;
  }

  Future<void> openCertificate(BigInt tokenId, String courseName) async {
    var getMetadata = await newActor!.getFunc(FieldsMethod.dip721TokenMetadata)?.call([tokenId]);
    var properties = getMetadata['Ok']['properties'];

    String? certificateContent;

    for (var property in properties) {
      if (property[0] == "certificate") {
        certificateContent = property[1]['TextContent'];
        break;
      }
    }

    print("Base64 : $certificateContent");

    Get.toNamed(Routes.viewCertificate, arguments: [certificateContent, courseName]);

  }

  Future<void> getCertificate(String courseId, String courseName) async {
    var selfData = await newActor!.getFunc(FieldsMethod.getSelf)?.call([]);
    print(selfData);

    var tokenIds = selfData['token_ids'] as List<List<dynamic>>?;

    if (tokenIds != null && tokenIds.isNotEmpty) {
      BigInt? tokenId;
      for (var pair in tokenIds) {
        if (pair[1] == courseId) {
          tokenId = pair[0] as BigInt;
          break;
        }
      }

      if (tokenId != null) {
        openCertificate(tokenId, courseName);
      } else {
        print("No token ID found for course ID: $courseId");
      }
    } else {
      print("No token IDs available in the user's profile.");
    }
  }

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
                      FutureBuilder<String>(
                        future: getName(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                              'Loading...', // You can replace this with a more appropriate loading message
                              style: textTheme(context).subtitle2?.copyWith(
                                    color: ColorsConst.tittleColor,
                                    fontSize: 20,
                                  ),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              'Error: ${snapshot.error}',
                              style: textTheme(context).subtitle2?.copyWith(
                                    color: ColorsConst.tittleColor,
                                    fontSize: 20,
                                  ),
                            );
                          } else {
                            return Text(
                              snapshot.data ?? "User",
                              style: textTheme(context).subtitle2?.copyWith(
                                    color: ColorsConst.tittleColor,
                                    fontSize: 20,
                                  ),
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
                  children: [
                    OverviewContainer(
                      text: "0",
                      subText: "Current balance",
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
                "Certificates",
                style: textTheme(context).bodyText1?.copyWith(
                      color: ColorsConst.tittleColor2,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              FutureBuilder<List<Map<String, String>>>(
                future:
                    getCourseNamesIdsAndCreators(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    List<Map<String, String>> coursesInfo = snapshot.data!;
                    return SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: coursesInfo.length,
                        itemBuilder: (context, index) {
                          var course = coursesInfo[index];
                          return GestureDetector(
                            onTap: () {
                              getCertificate(course['id'] ?? '', course['name'] ?? '');
                            },
                            child: NftCertificates(
                              courseName: course['name'] ?? 'Unknown Name',
                              courseCreator:
                                  course['creator'] ?? 'Unknown Creator',
                              image: ImageAssets
                                  .profilePic2,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    // Handle the case when there's no data
                    return Text("No certificates found.");
                  }
                },
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
                child: FutureBuilder<List<dynamic>>(
                  future: getRegisteredCourses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var course = snapshot.data![index];
                          return ReconmendedTile(
                            image: ImageAssets.jelurida,
                            id: course['id'],
                            tittle: course['creator_fullname'],
                            mainTittle: course['title'],
                            extraWidget: Column(
                              children: [
                                Text(
                                  "50% Completed",
                                  style: textTheme(context).caption,
                                ),
                                SizedBox(height: 3),
                                LinerPercentIndicator(),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Text("No courses registered");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

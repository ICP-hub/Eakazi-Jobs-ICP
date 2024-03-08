// ignore_for_file: must_be_immutable

import 'package:eakazijobs/helpers/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../integrations.dart';
import '../../authentication/login/view/screen/sign_in.dart' as SignIn;
import '../../employers/employers_profile/view/widgets/employer_profile_container.dart';
import '../../shared_widgets/buttons.dart';

class TrCourseDetail extends StatelessWidget {
  TrCourseDetail({Key? key}) : super(key: key);

  final courseId = Get.arguments[4];

  Future<List<dynamic>> getCourseApplicants() async {
    var applicants = await SignIn.newActor!.getFunc(FieldsMethod.getCourseApplicants)?.call([courseId]);
    print(applicants);
    return applicants;
  }

  var bodyText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed .";

  @override
  Widget build(BuildContext context) {
    final title = Get.arguments[0];
    final rating = Get.arguments[1];
    final aboutAuthor = Get.arguments[2];
    final status = Get.arguments[3];

    final description = title + " Course" + aboutAuthor;

    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? "Course details"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.trainerCourseStudentsEnrolled, arguments: courseId);
                            },
                            child: FutureBuilder<List<dynamic>>(
                              future: getCourseApplicants(),
                              builder: (context, snapshot) {
                                int applicantsCount = snapshot.data?.length ?? 0;
                                return OverviewContainer(
                                  text: applicantsCount.toString(),
                                  subText: "Students Enrolled",
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.trainerCertificateIssued, arguments: [courseId, title, description]);
                            },
                            child: OverviewContainer(
                              text: "100",
                              subText: "Certificates Issued",
                            ),
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
                          const SizedBox(
                            width: 5,
                          ),
                          OverviewContainer(
                            text: "120",
                            subText: "Days Left",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Text(
                      title ?? "Course Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Text(
                        bodyText,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, size: 20, color: Colors.amber),
                          const SizedBox(width: 5),
                          Text(
                            rating,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            aboutAuthor,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            status ? ". Active" : ". Ended",
                            style: TextStyle(
                                color: status ? Colors.green : Colors.red,
                                fontSize: 11),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "More info",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 24, right: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.circle,
                                      size: 8, color: Colors.deepOrangeAccent),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                                TextSpan(
                                  text:
                                      '  Interest or experience in designing for emerging markets and new internet users.',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.circle,
                                      size: 8, color: Colors.deepOrangeAccent),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                                TextSpan(
                                  text:
                                      '  Strong core mobile interaction design.',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.circle,
                                      size: 8, color: Colors.deepOrangeAccent),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                                TextSpan(
                                  text:
                                      '  Interest or experience in designing for emerging markets and new internet users.',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.circle,
                                      size: 8, color: Colors.deepOrangeAccent),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                                TextSpan(
                                  text:
                                      '  Strong core mobile interaction design.',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.circle,
                                      size: 8, color: Colors.deepOrangeAccent),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                                TextSpan(
                                  text:
                                      '  Interest or experience in designing for emerging markets and new internet users.',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.circle,
                                      size: 8, color: Colors.deepOrangeAccent),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                                TextSpan(
                                  text:
                                      '  Strong core mobile interaction design.',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: status ? singleButton(context) : doubleButtons(context),
          ),
        ],
      ),
    );
  }
}

Widget singleButton(BuildContext context) {
  final title = Get.arguments[0];
  final courseId = Get.arguments[4];
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: AuthBtn(
      text: "Edit Course",
      isComplete: true,
      onPressed: () {
        Get.toNamed(Routes.trainerEditCourse, arguments: [title, courseId]);
      },
    ),
  );
}

Widget doubleButtons(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AuthBtn(
          text: "Renew Course",
          isComplete: true,
          onPressed: () {
            // Define what happens when "Renew Course" is pressed
          },
        ),
        SizedBox(height: 10),
        DeleteBtn(
          text: "Delete Course",
          isComplete: true,
          onPressed: () {
            // Define what happens when "Delete Course" is pressed
          },
        ),
      ],
    ),
  );
}

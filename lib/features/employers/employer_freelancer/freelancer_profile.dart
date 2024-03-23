import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../../../constants/assets/icon_constans.dart';
import '../../../constants/assets/images_constants.dart';
import '../../../helpers/routes/app_pages.dart';
import '../../freelancer/profile/view/widgets/profile_container.dart';
import '../../shared_widgets/buttons.dart';
import '../../shared_widgets/svgs.dart';

class EmpFreelancerProfile extends StatefulWidget {
  const EmpFreelancerProfile({Key? key}) : super(key: key);

  @override
  _EmpFreelancerProfileState createState() => _EmpFreelancerProfileState();
}

class _EmpFreelancerProfileState extends State<EmpFreelancerProfile> {
  String? applicationStatus;

  Widget doubleButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AuthBtnBorder(
            text: "Decline Application",
            isComplete: true,
            onPressed: () {
              setState(() {
                applicationStatus = 'declined';
              });
            },
          ),
          SizedBox(height: 10),
          AuthBtn(
            text: "Accept Application",
            isComplete: true,
            onPressed: () {
              setState(() {
                applicationStatus = 'accepted';
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = Get.arguments[0];
    final reviewee_principal_id = Get.arguments[1];
    final reveiwee_id = Get.arguments[2];
    return Scaffold(
      appBar: AppBar(
        title: Text("$name's Profile"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.flChatList);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: const SvgIcon(IconsAssets.chatIcon),
            ),
          ),
        ],
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
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              const AssetImage(ImageAssets.studentImage),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  name ?? "Applicant Name",
                                  style: textTheme(context).subtitle2?.copyWith(
                                      color: ColorsConst.tittleColor, fontSize: 20),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.reviewScreen, arguments: [reviewee_principal_id, reveiwee_id]);
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        '4.8',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Icon(Icons.star, size: 16, color: Colors.amber),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "UI/UX Designer",
                              style: TextStyle(
                                color: ColorsConst.subTitleColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Complete profile",
                              style: TextStyle(
                                color: ColorsConst.tittleColor,
                                decoration: TextDecoration.underline,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.flChatList);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 5.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                    color: ColorsConst.blackFour,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Contact",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: ColorsConst.black,
                                    ),
                                  ),
                                ),
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
                      height: 10,
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          OverviewContainer(
                            text: "0",
                            subText: "Certifications",
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          OverviewContainer(
                            text: "0",
                            subText: "Jobs Completed",
                          ),
                        ],
                      ),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: SizedBox(
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
                    ),
                    const Reconmmended(),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "❗ No projects published yet",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (applicationStatus == null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: doubleButtons(context),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                applicationStatus == 'accepted'
                    ? "Application Accepted"
                    : "Application Declined",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                color: applicationStatus == 'accepted' ? Colors.green : Colors.red,),
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
      padding: const EdgeInsets.only(top: 30, right: 24),
      child: Row(
        children: [
          Text("Published Projects", style: textTheme(context).headline4),
          const Spacer(),
          Text("See All",
              //   "Skill Acquisition",
              style: textTheme(context).headline4),
        ],
      ),
    );
  }
}


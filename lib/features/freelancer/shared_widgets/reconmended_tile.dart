import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/theme/color_selection.dart';
import '../../../helpers/routes/app_pages.dart';
import '../../../helpers/utils/utils.dart';

class ReconmendedTile extends StatelessWidget {
  const ReconmendedTile({
    Key? key,
    required this.tittle,
    required this.image,
    this.subTittle2 = "Remote",
    this.mainTittle = "Visual Designer - UI Designer",
    this.extraWidget,
  }) : super(key: key);

  final String tittle;
  final String subTittle2;

  final String image;
  final String mainTittle;
  final Widget? extraWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.flCourseDetails);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 11),
        child: Container(
          // margin: const EdgeInsets.only(top: 26, right: 11),
          padding: const EdgeInsets.all(8),
          height: 80,
          width: 100.w,
          // width: 97,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF587CF4).withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
            color: ColorsConst.white,
            border: Border.all(color: ColorsConst.primary.withOpacity(0.08)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Material(
                shape: CircleBorder(),
                elevation: 0.5,
                child: CircleAvatar(
                  radius: 24,
                  //IconsAssets.skillAquasition),
                  backgroundColor: ColorsConst.white,
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(image) //ImageAssets.google),
                      ),
                ),
              ),
              // const Spacer(),s
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tittle,
                      //   "Skill Acquisition",
                      style: textTheme(context).button?.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: ColorsConst.secoundary.withOpacity(0.6)),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            mainTittle,
                            overflow: TextOverflow.ellipsis,
                            //   "Skill Acquisition",
                            style: textTheme(context).headline4,
                          ),
                        ),
                        extraWidget ??
                            Text(
                              "3hrs Ago .",
                              //   "Skill Acquisition",
                              style: textTheme(context).caption,
                            ),
                      ],
                    ),
                    Text(
                      subTittle2, // "Remote",
                      //   "Skill Acquisition",
                      style: textTheme(context).caption,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReconmendedTileJobs extends StatelessWidget {
  const ReconmendedTileJobs({
    Key? key,
    required this.tittle,
    required this.image,
    this.subTittle2 = "Remote",
    this.mainTittle = "Visual Designer - UI Designer",
    this.extraWidget,
  }) : super(key: key);

  final String tittle;
  final String subTittle2;

  final String image;
  final String mainTittle;
  final Widget? extraWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.flJobsDetails);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 11),
        child: Container(
          // margin: const EdgeInsets.only(top: 26, right: 11),
          padding: const EdgeInsets.all(8),
          height: 80,
          width: 100.w,
          // width: 97,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF587CF4).withOpacity(0.12),
                  blurRadius: 13,
                  offset: Offset(0, 10))
            ],
            color: ColorsConst.white,
            border: Border.all(color: ColorsConst.primary.withOpacity(0.08)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Material(
                shape: CircleBorder(),
                elevation: 0.5,
                child: CircleAvatar(
                  radius: 24,
                  //IconsAssets.skillAquasition),
                  backgroundColor: ColorsConst.white,
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(image) //ImageAssets.google),
                      ),
                ),
              ),
              // const Spacer(),s
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tittle,
                      //   "Skill Acquisition",
                      style: textTheme(context).button?.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: ColorsConst.secoundary.withOpacity(0.6)),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            mainTittle,
                            overflow: TextOverflow.ellipsis,
                            //   "Skill Acquisition",
                            style: textTheme(context).headline4,
                          ),
                        ),
                        extraWidget ??
                            Text(
                              "3hrs Ago .",
                              //   "Skill Acquisition",
                              style: textTheme(context).caption,
                            ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          subTittle2, // "Remote",
                          //   "Skill Acquisition",
                          style: textTheme(context).caption?.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Text(
                          "Today", // "Remote",
                          //   "Skill Acquisition",
                          style: textTheme(context).caption?.copyWith(
                              fontSize: 10, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AssessementCoursesTile extends StatelessWidget {
  const AssessementCoursesTile({
    Key? key,
    required this.tittle,
    required this.image,
    this.subTittle2 = "Remote",
    this.mainTittle = "Visual Designer - UI Designer",
    this.extraWidget,
  }) : super(key: key);

  final String tittle;
  final String subTittle2;

  final String image;
  final String mainTittle;
  final Widget? extraWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.freeLanceCourseVideos);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 11),
        child: Material(
          // shadowColor: ,
          // borderRadius: BorderRadius.circular(10),
          elevation: 1.17,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            // margin: const EdgeInsets.only(top: 26, right: 11),
            padding: const EdgeInsets.all(8),
            height: 105,
            width: 100.w,
            // width: 97,
            decoration: BoxDecoration(
              color: ColorsConst.white,
              border: Border.all(color: ColorsConst.primary.withOpacity(0.08)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      color: ColorsConst.red,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(23),
                    child: CircleAvatar(
                        radius: 13,
                        backgroundColor: ColorsConst.white,
                        child: Icon(
                          Icons.play_arrow,
                          color: ColorsConst.red,
                        )),
                  ),
                ),
                // const Spacer(),s
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Web Design: Strategy and Information Architecture",
                        //   "Skill Acquisition",
                        style: textTheme(context).headline6,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "NGN 50.000",
                        //   "Skill Acquisition",
                        style: textTheme(context).headline6?.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: ColorsConst.gold,
                            size: 12,
                          ),
                          Text(
                            " 4.5", // "Remote",
                            //   "Skill Acquisition",
                            style: textTheme(context)
                                .caption
                                ?.copyWith(color: ColorsConst.black),
                          ),
                          Text(
                            " . By Jelafrica . All Level", // "Remote",
                            //   "Skill Acquisition",
                            style: textTheme(context).headline6,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseSectionVideo extends StatelessWidget {
  const CourseSectionVideo({
    Key? key,
    required this.tittle,
    this.subTittle2 = "Remote",
    this.mainTittle = "Visual Designer - UI Designer",
    this.extraWidget,
  }) : super(key: key);

  final String tittle;
  final String subTittle2;

  final String mainTittle;
  final Widget? extraWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.freelancercoursesassesment);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Container(
          // margin: const EdgeInsets.only(top: 26, right: 11),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          height: 6.h,
          width: 100.w,
          // width: 97,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF587CF4).withOpacity(0.03),
                  blurRadius: 5,
                  offset: Offset(0, 10))
            ],
            color: ColorsConst.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Spacer(),s

              Text(
                tittle,
                //   "Skill Acquisition",
                style: textTheme(context).headline6?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorsConst.secoundary.withOpacity(0.6)),
              ),
              Text(
                subTittle2, // "Remote",
                //   "Skill Acquisition",
                style: textTheme(context).headline6?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: ColorsConst.blackThree,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/utils/utils.dart';

import '../../../shared_widgets/tab_text.dart';
import '../controller/freelancer_course_details_ctrl.dart';
import '../widgets/course_text_widget.dart';

class FLCoursesDetails extends StatelessWidget {
  const FLCoursesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabCtrl = Get.find<FLCoursesDetailsCtrl>();
    final courseName = Get.arguments[0];
    final author = Get.arguments[1];
    final image = Get.arguments[2];
    final courseId = Get.arguments[3];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Course details"),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Material(
                    shape: const CircleBorder(),
                    elevation: 6,
                    child: CircleAvatar(
                      radius: 45,
                      //IconsAssets.skillAquasition),
                      backgroundColor: ColorsConst.white,
                      child: Image.asset(
                        image,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    courseName ?? "Course Name",
                    style: textTheme(context).bodyText1?.copyWith(fontSize: 25),
                  ),
                  Text(
                    author ?? "Author",
                    style: textTheme(context).overline,
                  ),
                ],
              ),
            ),
            SliverAppBar(
              floating: true,
              pinned: true,
              toolbarHeight: 0,
              bottom: PreferredSize(
                preferredSize: Size(width(context), 70),
                child: Container(
                  height: 35,
                  margin:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 13,
                          offset: const Offset(0, 10))
                    ],
                    color: ColorsConst.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TabBar(
                    isScrollable: false,

                    labelStyle: textTheme(context)
                        .headline6
                        ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    controller: tabCtrl.tabController,
                    indicatorPadding: EdgeInsets.zero,
                    unselectedLabelStyle: textTheme(context)
                        .headline6
                        ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    // indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 2,
                    indicator: BoxDecoration(
                        color: ColorsConst.black,
                        borderRadius: BorderRadius.circular(5)),
                    indicatorColor: colorScheme(context).primary,
                    // give the indicator a decoration (color and border radius)

                    labelColor: Colors.white,
                    unselectedLabelColor: ColorsConst.blackFour,
                    tabs: const [
                      // first tab [you can add an icon using the icon property]
                      Tab(
                        child: TabText(
                          isNotify: false,
                          tittle: "Description",
                        ),
                      ),
                      Tab(
                        child: TabText(
                          isNotify: false,
                          tittle: "Content",
                        ),
                      ),
                      Tab(
                        child: TabText(
                          isNotify: false,
                          tittle: "About",
                        ),
                      ),

                      // second tab [you can add an icon using the icon property]
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabCtrl.tabController,
          children: [
            CourseDescription(title: "Course Description", body: bodyTexxt, courseId: courseId),
            CourseDescription(title: "Course Content", body: bodyTexxt, courseId: courseId),
            CourseDescription(title: "About Course", body: bodyTexxt, courseId: courseId),
          ],
        ),
      ),
    );
  }
}

const bodyTexxt =
    "To apply for this job you need to take the assessment course, pass the quiz and get a certificate to proove proficiency. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.......Lorem ipsum dolor sit amet, consectetur adipiscing.";

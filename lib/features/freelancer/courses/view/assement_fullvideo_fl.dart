import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/theme/color_selection.dart';
import '../../../../helpers/utils/utils.dart';
import '../../../shared_widgets/tab_text.dart';
import '../../shared_widgets/reconmended_tile.dart';
import '../controller/assement_course_ctrl_vd.dart';

class FLAssesmentVideo extends StatelessWidget {
  const FLAssesmentVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabCtrl = Get.find<AssesmentVidCourseCtrl>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assessment Course"),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Container(
                height: 25.h,
                width: 100.w,
                color: Colors.black,
              ),
            ),
            SliverAppBar(
              floating: true,
              pinned: true,
              toolbarHeight: 0,
              bottom: TabBar(
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
                indicator: const BoxDecoration(color: ColorsConst.white),
                indicatorColor: colorScheme(context).primary,
                // give the indicator a decoration (color and border radius)

                labelColor: colorScheme(context).primary,
                unselectedLabelColor: ColorsConst.blackFour,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  const Tab(
                    child: TabText(
                      isNotify: false,
                      tittle: "Course Content",
                    ),
                  ),
                  const Tab(
                    child: TabText(
                      isNotify: false,
                      tittle: "Transcript",
                    ),
                  ),

                  // second tab [you can add an icon using the icon property]
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabCtrl.tabController,
          children: [
            Container(
                child: ListView(
              children: List.generate(
                  6,
                  (index) => CourseSectionVideo(
                        tittle: "Section 1 : Welcome to Jelafrica UX Design",
                        subTittle2: "Video . 14 min",
                      )),
            )),
            Container(),
          ],
        ),
      ),
    );
  }
}

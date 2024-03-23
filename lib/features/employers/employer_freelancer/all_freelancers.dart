import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../../../constants/assets/icon_constans.dart';
import '../../../constants/assets/images_constants.dart';
import '../../../constants/theme/color_selection.dart';
import '../../../helpers/routes/app_pages.dart';
import '../../../integrations.dart';
import '../../authentication/login/view/screen/sign_in.dart';
import '../../freelancer/shared_widgets/media_container.dart';

class AllFreelancers extends StatelessWidget {
  AllFreelancers({Key? key}) : super(key: key);

  Future<List<dynamic>> getAllFreelancers() async {
    var freelancers = await newActor!.getFunc(FieldsMethod.getAllFreelancers)?.call([]);
    return freelancers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Freelancers"),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 47,
              width: 100.w,
              decoration: BoxDecoration(
                color: ColorsConst.white,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: ColorsConst.blackFour,
                ),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'freelancers....',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 13,
                          color: ColorsConst.blackFour,
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.search, color: ColorsConst.blackFour)
                ],
              ),
            ),
            const MediaListWidget(),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: getAllFreelancers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var applicant = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: ColorsConst.blackFour,
                                  width: 0.1,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.flProfilePublic, arguments: [applicant['fullname'], applicant['principal_id'], applicant['id']]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                          AssetImage(ImageAssets.studentImage),
                                          radius: 19,
                                        ),
                                        const SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  applicant['fullname'],
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w800,
                                                    color: ColorsConst.black,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                Icon(
                                                  Icons.circle,
                                                  size: 7.sp,
                                                  color: ColorsConst.green,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "UI/UX Designer",
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w400,
                                                color: ColorsConst.blackFour,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                      height: 4.h,
                                      decoration: BoxDecoration(
                                        // color: ColorsConst.white,
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                          color: ColorsConst.blackFour,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "View Profile",
                                          style: TextStyle(
                                            fontSize: 8.sp,
                                            color: ColorsConst.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Text("No data available");
                  }
                },
              ),
            ),
          ],
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
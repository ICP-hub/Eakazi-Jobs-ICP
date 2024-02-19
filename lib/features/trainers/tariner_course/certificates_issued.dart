import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/assets/images_constants.dart';
import '../../../constants/theme/color_selection.dart';
import '../../../helpers/utils/utils.dart';

class CertificateIssued extends StatelessWidget {
  const CertificateIssued({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Certificates"),
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
                        hintText: 'students....',
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
            const SizedBox(height: 20),
            OverviewContainer(
              text: "100",
              subText: "Certificates Issued",
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ColorsConst.blackFour,
                            width: 0.1,
                          ),
                        ),
                      ),
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
                                          "Obi Derrick",
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
                              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                  "Issue Certificate",
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverviewContainer extends StatelessWidget {
  const OverviewContainer({
    Key? key,
    required this.text,
    required this.subText,
  }) : super(key: key);
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.h,
      width: 165.h,
      // alignment: Alignment.center,
      padding: EdgeInsets.only(left: 15, right: 10),
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: ColorsConst.profileContainer.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: textTheme(context).bodyText1?.copyWith(
              // color: color,
                fontSize: 20),
          ),
          Text(
            subText,
            style: textTheme(context).bodyText2?.copyWith(
                color: ColorsConst.tittleColor,
                fontSize: 10,
                letterSpacing: 1,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

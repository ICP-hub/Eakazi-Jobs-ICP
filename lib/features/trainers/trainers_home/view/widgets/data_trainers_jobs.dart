import 'package:eakazijobs/constants/assets/images_constants.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../helpers/routes/app_pages.dart';

class JobsTrainersWidgte extends StatelessWidget {
  const JobsTrainersWidgte({
    Key? key,
    this.image = ImageAssets.course,
    required this.title,
    this.price = "\$50.00",
    this.rating = "4.5",
    this.desc = ". By JelaAfrica. All level. 0 Students",
    this.status = true,
    this.extraWidget,
    this.id,
  }) : super(key: key);

  final String image;
  final String title;
  final String price;
  final String rating;
  final String desc;
  final bool status;
  final Widget? extraWidget;

  final String? id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.trainerCourseDetails, arguments: [title, rating, desc, status, id]);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 11),
        child: Container(
          padding: const EdgeInsets.all(14),
          height: 100,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xFF587CF4).withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 4),
              )
            ],
            color: ColorsConst.white,
            border: Border.all(color: ColorsConst.primary.withOpacity(0.08)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w200,
                            color: ColorsConst.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          price,
                          style: textTheme(context).button?.copyWith(
                            fontSize: 12,
                            color: ColorsConst.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, size: 14, color: Colors.amber),
                              Text(
                                rating,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  desc,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 9.5,
                                    color: Colors.grey[500],
                                  ),
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
              Positioned(
                top: 2,
                right: 8,
                child: Text(
                  status ? "Active" : "Ended",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: status ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

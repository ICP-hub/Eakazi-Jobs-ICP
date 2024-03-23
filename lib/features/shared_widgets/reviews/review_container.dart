import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constants/assets/images_constants.dart';
import '../../../constants/theme/color_selection.dart';

class ReviewContainer extends StatelessWidget {
  ReviewContainer({
    Key? key,
    required this.rating,
    required this.reviewer,
    required this.title,
    required this.review,
    required this.reviewTime,
    // required this.currentTime,
  }) : super(key: key);

  final BigInt reviewTime;
  final double rating;
  final String reviewer;
  final String title;
  final String review;

  String calculateDuration() {
    DateTime currentTime = DateTime.now();
    DateTime review_time_dateTime = DateTime.fromMillisecondsSinceEpoch(reviewTime.toInt());
    Duration difference = currentTime.difference(review_time_dateTime);

    String duration = "2 mins ago";

    if (difference.inDays > 0) {
      duration =  '${difference.inDays} day(s) ago';
    } else if (difference.inHours > 0) {
      duration = '${difference.inHours} hour(s) ago';
    } else if (difference.inMinutes > 0) {
      duration = '${difference.inMinutes} min(s) ago';
    } else if (difference.inSeconds > 0) {
      duration = '${difference.inSeconds} sec(s) ago';
    } else {
      duration = 'just now';
    }

    return duration;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorsConst.blackThree,
            width: 0.2,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: AssetImage(ImageAssets.reviewLogo)),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reviewer,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              RatingBar.builder(
                                itemSize: 20,
                                initialRating: rating,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ignoreGestures: true,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star_rounded,
                                  size: 5,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {}
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                calculateDuration(),
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.more_vert,
                            size: 26,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              review,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

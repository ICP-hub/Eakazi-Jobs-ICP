import 'package:agent_dart/principal/principal.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../shared_widgets/buttons.dart';
import 'package:eakazijobs/integrations.dart';
import '../../../helpers/routes/app_pages.dart';
import 'package:eakazijobs/features/shared_widgets/reviews/no_review_widget.dart';
import 'package:eakazijobs/features/shared_widgets/reviews/review_container.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart'
    as SignIn;

class ReviewScreen extends StatelessWidget {
  ReviewScreen({Key? key}) : super(key: key);

  final reviewee_principal = Get.arguments[0];

  Future<bool> confirmUser() async {
    var confirmUser = await SignIn.newActor!
        .getFunc(FieldsMethod.confirmReviewer)
        ?.call([reviewee_principal]);
    print("Confirm User : $confirmUser");
    return confirmUser;
  }

  Future<List<dynamic>> getReviews() async {
    String reviewee_p_string = reviewee_principal.toString();
    Principal reviewee_Principal = Principal.fromText(reviewee_p_string);
    var getReviews = await SignIn.newActor!
        .getFunc(FieldsMethod.getAllReviews)
        ?.call([reviewee_Principal]);
    return getReviews;
  }

  Future<bool> confirmReviewed() async {
    String reviewee_p_string = reviewee_principal.toString();
    Principal reviewee_Principal = Principal.fromText(reviewee_p_string);
    var confirmReviewed = await SignIn.newActor!
        .getFunc(FieldsMethod.confirmReviewed)
        ?.call([reviewee_Principal]);
    print("confirm reviewed or not: $confirmReviewed");
    return confirmReviewed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reviews')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: getReviews(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 24, right: 24),
                      child: Column(
                        children: snapshot.data!.map((review) {
                          return ReviewContainer(
                            rating: review['ratings'],
                            reviewer: review['reviewer'],
                            title: review['title'],
                            review: review['review'],
                            reviewTime: review['review_time'],
                          );
                        }).toList(),
                      ),
                    );
                  } else {
                    return Center(child: NoReviewWidget());
                  }
                } else {
                  return Center(child: Text('An error occurred'));
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: FutureBuilder<bool>(
              future: confirmUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data == false) {
                    return FutureBuilder<bool>(
                      future: confirmReviewed(),
                      builder: (context, reservedSnapshot) {
                        if (reservedSnapshot.connectionState ==
                            ConnectionState.done) {
                          return reservedSnapshot.data ?? false
                              ? SizedBox()
                              : singleButton(context);
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget singleButton(BuildContext context) {
  final reviewee_principal = Get.arguments[0];
  final reviewee_id = Get.arguments[1];
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: AuthBtn(
      text: "Write a review",
      isComplete: true,
      onPressed: () {
        Get.toNamed(Routes.writeReview,
            arguments: [reviewee_principal, reviewee_id]);
      },
    ),
  );
}

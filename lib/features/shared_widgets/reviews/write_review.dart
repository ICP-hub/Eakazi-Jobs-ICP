import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart'
    as SignIn;
import 'package:eakazijobs/integrations.dart';
import '../../../helpers/routes/app_pages.dart';
import '../input_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../../constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/customLoader.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:eakazijobs/features/shared_widgets/buttons.dart';

class WriteReview extends StatefulWidget {
  WriteReview({Key? key}) : super(key: key);

  @override
  _WriteReviewState createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  double rating = 3;
  String? title;
  String? review;
  String? imageName;
  String image = "";
  final reviewee_id = Get.arguments[1];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CustomLoader customLoader = CustomLoader();

  void _attachImage() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (result == null) return;

    // we get the file from result object
    final file = result.files.first;
    double sizeInMb = file.size / (1024 * 1024);
    if (sizeInMb > 1){
      customLoader.showLoader("Please Upload a file size less than 1 Mb");
      Future.delayed(Duration(seconds: 2), () {
        customLoader.dismissLoader();
      });
      return;
    }
    print("File bytes:  $sizeInMb");

    File certificate = File(file.path!); // Converting into file
    Uint8List imageBytes =
        await certificate.readAsBytes(); //converting to bytes
    String base64string =
        base64.encode(imageBytes); //converting bytes to base64 string
    print(base64string);

    image = base64string;

    setState(() {
      imageName = file.name;
    });
  }

  submit(context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    int review_time = DateTime.now().millisecondsSinceEpoch;

    customLoader.showLoader('Adding review');

    try {
      // API Call
      var addReview = await SignIn.newActor!
          .getFunc(FieldsMethod.addReviews)
          ?.call([rating.toDouble(), title!.toString(), review!.toString(), image.toString(), reviewee_id!.toString(), review_time.toInt()]);
      print(addReview);
    } catch (e) {
      print("Error: $e");
    }

    customLoader.showSuccess('Review added');

    Get.toNamed(Routes.reviewScreen, arguments: [Get.arguments[0], Get.arguments[1]]);
  }

  @override
  Widget build(BuildContext context) {
    ValidateInputController c = Get.put(ValidateInputController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Review'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Rating",
                        style: TextStyle(
                          color: ColorsConst.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (ratingValue) =>
                            setState(() => rating = ratingValue),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Title",
                        style: TextStyle(
                          color: ColorsConst.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      InputTextNormal4(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onSave: (value) {
                            title = value;
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter title';
                            }
                            return null;
                          },
                          hintText: "Enter review title",
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Review",
                        style: TextStyle(
                          color: ColorsConst.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      InputTextArea2(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSave: (value) {
                          review = value;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter title';
                          }
                          return null;
                        },
                        hintText: "Review",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Attach image",
                        style: TextStyle(
                          color: ColorsConst.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _attachImage();
                            },
                            child: Text('Attach Image'),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          if (imageName != null) ...[
                            const SizedBox(width: 8),
                            Icon(Icons.check_circle_outline),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Text(imageName!,
                                    overflow: TextOverflow.ellipsis)),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: AuthBtn(
                text: "Done",
                isComplete: c.isValidated.value == true ? true : false,
                onPressed: () {
                  submit(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ValidateInputController extends GetxController {
  RxBool isValidated = false.obs;
  void updateValidateStatus(state) => isValidated.value = state;
}

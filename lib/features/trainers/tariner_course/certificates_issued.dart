import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';

import '../../../constants/assets/images_constants.dart';
import '../../../constants/theme/color_selection.dart';
import '../../../helpers/routes/app_pages.dart';
import '../../../helpers/utils/utils.dart';
import '../../../integrations.dart';
import '../../authentication/login/view/screen/sign_in.dart';

class CertificateIssued extends StatelessWidget {
  CertificateIssued({Key? key}) : super(key: key);

  final courseId = Get.arguments[0];
  final title = Get.arguments[1];
  final description = Get.arguments[2];

  Future<List<dynamic>> getCourseApplicants() async {
    var applicants = await newActor!.getFunc(FieldsMethod.getCourseApplicants)?.call([courseId]);
    print(applicants);
    return applicants;
  }

  void _pickFile(BuildContext context, principalId, userId, userName) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (result == null) return;

    // we get the file from result object
    final file = result.files.first;
    File certificate = File(file.path!); // Converting into file
    Uint8List imageBytes = await certificate.readAsBytes(); //converting to bytes
    String base64string = base64.encode(imageBytes); //converting bytes to base64 string
    print(base64string);

    final certificateTag = userName + "_" + title;

    _showLoadingDialog(context, "Minting Certificate...");

    try {
      final mintCertificate = await newActor!.getFunc(FieldsMethod.mintCertificate)?.call([principalId, description, certificateTag, courseId, base64string]);
      print(mintCertificate);
      _hideLoadingDialog(context);
      _showSuccessDialog(context, "Certificate minted successfully");
    } catch (e) {
      _hideLoadingDialog(context);
      _showErrorDialog(context, "Error minting certificate");
    }

  }

  void _hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _showLoadingDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth:
                    3,
                  ),
                ),
                const SizedBox(width: 24),
                Text(text),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success"),
          content: Text(text),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(text),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


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
            FutureBuilder<List<dynamic>>(
              future: getCourseApplicants(), // to change to getCourseCertificates
              builder: (context, snapshot) {
                int applicantsCount = snapshot.data?.length ?? 0;
                return OverviewContainer(
                  text: applicantsCount.toString(),
                  subText: "Certificates Issued",
                );
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: getCourseApplicants(),
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
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.trainerFreelancerProfile, arguments: applicant['fullname']);
                                      },
                                      child: Row(
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
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _pickFile(context, applicant['principal_id'], applicant['id'], applicant['fullname']);
                                      },
                                      child: Container(
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
                                            "Issue Certificate",
                                            style: TextStyle(
                                              fontSize: 8.sp,
                                              color: ColorsConst.black,
                                            ),
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

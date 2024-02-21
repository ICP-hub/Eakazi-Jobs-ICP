import 'package:flutter/material.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../shared_widgets/profile_image_contanainer.dart';

class AppBarTittle extends StatelessWidget {
  const AppBarTittle({
    Key? key,
    required this.lastSeen,
    required this.profileImage,
  }) : super(key: key);

  final String lastSeen;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    // final ctrl = Get.find<ConversationCtrl>();
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: Stack(
            children: [
              ProfileImage(image: profileImage),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Mayowa Stack",
                  style: textTheme(context)
                      .subtitle1
                      ?.copyWith(fontSize: 16, color: Colors.black)),
              Text(
                "Employer",
                style: textTheme(context).subtitle1?.copyWith(
                    fontSize: 12, color: Colors.black.withOpacity(0.4)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../helpers/utils/utils.dart';

class NoReviewWidget extends StatelessWidget {
  const NoReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline_outlined,
          color: Colors.grey,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'User has no reviews yet',
          style: textTheme(context).titleMedium?.copyWith(color: Colors.grey),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: RichText(
            text: TextSpan(
              text: 'Click',
              style:
                  textTheme(context).titleMedium?.copyWith(color: Colors.grey),
              children: [
                TextSpan(
                  text: " here for more info",
                  style: textTheme(context)
                      .titleMedium
                      ?.copyWith(color: colorScheme(context).primary),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

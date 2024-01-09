import 'package:flutter/material.dart';

import '../../constants/assets/images_constants.dart';
import '../../helpers/theme/theme.dart';
import 'image_container/service/network_image_cached.dart';

class ProfileImage extends StatelessWidget with NetworkImageCached {
  const ProfileImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return image != ""
        ? networkImagecache(
            url: image,
            child: (context, imageProvider) => Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
                borderRadius: smallBoxCornerRadius,
              ),
            ),
            placeHolder: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  // borderRadius: smallBoxCornerRadius,
                  shape: BoxShape.circle),
            ),
          )
        : Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                image: _assettIamage(),
                // borderRadius: smallBoxCornerRadius,
                shape: BoxShape.circle,
                color: Colors.grey),
          );
  }

  DecorationImage _assettIamage() {
    return const DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage(ImageAssets.emptyImage),
    );
  }

  DecorationImage _networkImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(image),
    );
  }
}

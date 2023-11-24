// TODO: get user id from share prefrence or room
import 'package:flutter/material.dart';

import 'profile_image_contanainer.dart';

class AvatarContainerNetwork extends StatelessWidget {
  const AvatarContainerNetwork({
    Key? key,
    this.height = 35,
    this.width = 35,
  }) : super(key: key);

  final double height;
  final double width;

  // final types.Room room;

  @override
  Widget build(BuildContext context) {
    // var color = Colors.transparent;

    // if (room.type == types.RoomType.direct) {
    //   try {
    //     final otherUser = room.users.firstWhere((u) => u.id != "should thro",
    //         orElse: () => room.users[0]);

    //     color = getUserAvatarNameColor(otherUser);
    //   } catch (e) {
    //     // Do nothing if other user is not found.
    //   }
    // }
    // final hasImage = room.imageUrl != null && room.imageUrl!.isNotEmpty;
    // final name = room.name ?? '';
    return ProfileImage(image: "");
  }
}

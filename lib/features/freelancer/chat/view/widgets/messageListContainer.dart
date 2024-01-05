import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/theme/theme.dart';
import '../../../../../helpers/utils/simple_formaters.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../shared_widgets/badges.dart';
import '../../../../shared_widgets/image_avatars.dart';

class MessagesContainer extends StatelessWidget {
  const MessagesContainer({
    Key? key,
    required this.isRead,
    required this.room,
  }) : super(key: key);

  final bool isRead;
  final types.Room room;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.fromLTRB(4, 18, 4, 14),
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      // decoration: isRead
      //     ? null
      //     : BoxDecoration(
      //         color: ColorsConst.white, borderRadius: miniBoxCornerRadius),
      child: Row(
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: Stack(
              children: const [
                AvatarContainerNetwork(
                  height: 38,
                  width: 38,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 19,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Obi Deric",
                      style:
                          textTheme(context).bodyText1?.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorsConst.green,
                    )
                  ],
                ),
                Text(
                  "Good day, i hope this message finds y...",
                  style: textTheme(context).caption?.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          // Spacer(),
          // ChatBadges()
          // MessageCount(room: room),
        ],
      ),
    );
  }
}

class MessageCount extends StatelessWidget {
  const MessageCount({
    Key? key,
    required this.room,
  }) : super(key: key);

  final types.Room room;

  @override
  Widget build(BuildContext context) {
    // final currentUserId = auth.currentUser!.uid;
    int messageCount = 0;
    // if (room.metadata?["currentUserMessage"] != currentUserId) {
    //   messageCount = room.metadata?["newMessageCount"] ?? 0;
    // }
    // print("user id" + currentUserId);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 16,
          height: 16,
          alignment: Alignment.center,
          decoration: messageCount == 0
              ? null
              : BoxDecoration(
                  color: colorScheme(context).primary,
                  borderRadius: verysmallBoxCornerRadius),
          child: messageCount == 0
              ? null
              : Text(
                  messageCount.toString(),
                  style: textTheme(context)
                      .headline5
                      ?.copyWith(color: ColorsConst.white),
                ),
        ),
        // const Spacer(),
        CurrentTimeWidget(room: room),
      ],
    );
  }
}

class CurrentTimeWidget extends StatelessWidget {
  const CurrentTimeWidget({
    Key? key,
    required this.room,
  }) : super(key: key);

  final types.Room room;
  @override
  Widget build(BuildContext context) {
    final date = SimpleFormaters.getTime(
        room.updatedAt ?? DateTime.now().millisecondsSinceEpoch);
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Text(
        date,
        style:
            textTheme(context).overline?.copyWith(color: ColorsConst.blackTwo),
      ),
    );
  }
}

class LastMessagesWidgets extends StatelessWidget {
  const LastMessagesWidgets({
    Key? key,
    required this.room,
  }) : super(key: key);

  final types.Room room;

  @override
  Widget build(BuildContext context) {
    String lastMessage;
    if (room.lastMessages != null) {
      lastMessage = (room.lastMessages![0] as types.TextMessage).text;
    } else {
      lastMessage = "";
    }
    return Text(
      lastMessage,
      overflow: TextOverflow.ellipsis,
      style:
          textTheme(context).bodyText1?.copyWith(color: ColorsConst.blackThree),
    );
  }
}

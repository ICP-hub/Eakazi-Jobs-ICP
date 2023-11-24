import 'package:async/async.dart';
import 'package:eakazijobs/features/shared_widgets/search_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:sizer/sizer.dart';

import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/utils/utils.dart';
import '../widgets/employer_messageListContainer.dart';

class EmployerChatLists extends StatelessWidget {
  const EmployerChatLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final tabCtrl = Get.find<ChatListTabCtrl>();
    return Scaffold(
      appBar: AppBar(
        // leading: InkWell(
        //     onTap: () {
        //       Get.back();
        //     },
        //     child: const Icon(Icons.arrow_back_rounded)),
        title: Text("Messages"),
        actions: [
          Icon(Icons.add),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          children: [
            SearchContainer(),
            Expanded(child: Messages()),
          ],
        ),
      ),
    );
  }
}

const isReads = [true, false, true, true, false, true, false];

class Messages extends StatelessWidget {
  const Messages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ctrl = Get.find<ChatListTabCtrl>();

    return ListView.separated(
      itemCount: 5,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        // final room = data[index];
        return InkWell(
          onTap: () {
            // Get.toNamed(Routes.conversation, arguments: room);
          },
          child: MessagesContainer(
            room: types.Room(
                id: "user_Id", type: types.RoomType.direct, users: []),
            isRead: false,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Divider(),
        );
      },
    );
  }
}

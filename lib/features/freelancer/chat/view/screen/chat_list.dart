import 'package:eakazijobs/helpers/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:sizer/sizer.dart';

import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/utils/utils.dart';
import '../widgets/messageListContainer.dart';

class ChatLists extends StatelessWidget {
  const ChatLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final tabCtrl = Get.find<ChatListTabCtrl>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SearchContainer(),
            const SizedBox(height: 10),
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
            Get.toNamed(Routes.flConverstation);
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

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 26),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 47,
      width: 100.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: ColorsConst.blackFour,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible( // Wrap the Text widget with Flexible
            child: Text(
              "Search users",
              style: textTheme(context).overline,
              overflow: TextOverflow.ellipsis, // Handle text overflow
            ),
          ),
          const Icon(Icons.search, color: ColorsConst.blackFour)
        ],
      ),
    );
  }
}
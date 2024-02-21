import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/theme/theme.dart';
import '../../../../../helpers/utils/utils.dart';
import '../widgets/app_bar.dart';

class Conversations2 extends StatefulWidget {
  const Conversations2({super.key});

  @override
  State<Conversations2> createState() => _Conversations2State();
}

class _Conversations2State extends State<Conversations2> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  @override
  Widget build(BuildContext context) {
    void _addMessage(types.Message message) {
      setState(() {
        _messages.insert(0, message);
      });
    }

    void _handleSendPressed(types.PartialText message) {
      final textMessage = types.TextMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: Random().nextInt(1000000).toString(),
        text: message.text,
      );

      _addMessage(textMessage);
    }

    return Scaffold(
        appBar: AppBar(
          title: const AppBarTittle(lastSeen: "now", profileImage: ""),
        ),
        // TODO: try this line with no internet
        body: SafeArea(
            child: Chat(
          theme: chatTheme(context, "rock ", ""),
          isAttachmentUploading: false,
          showUserAvatars: false,
          showUserNames: true,
          messages: _messages,
          onSendPressed: _handleSendPressed,
          inputOptions: InputOptions(onTextChanged: (_) {}),
          user: _user,
        )));
  }

  // SafeArea(
  //         child: Chat(
  //           // previewTapOptions: PreviewTapOptions(),
  //           // customMessageBuilder: (p0, {required messageWidth}) {
  //           //   return Container(
  //           //     child: Text(p0.metadata?["themessage"]),
  //           //   );
  //           // },

  //           theme: chatTheme(context, replymessage, hintText),
  //           messages: ctrl.messages,
  //           onAttachmentPressed: () => ctrl.handleAtachmentPressed(context),
  //           onMessageTap: ctrl.handleMessageTap,
  //           onPreviewDataFetched: ctrl.handlePreviewDataFetched,
  //           onSendPressed: ctrl.handleSendPressed,
  //           showUserAvatars: true,
  //           showUserNames: true,
  //           user: ctrl.user,
  //           isAttachmentUploading: false,
  //           inputOptions: InputOptions(onTextChanged: (value) {}),
  //         ),
  //       );

  DefaultChatTheme chatTheme(
      BuildContext context, String replymessage, String hintText) {
    // final ctrl = Get.find<ConversationCtrl>();
    return DefaultChatTheme(
      // messageInsetsHorizontal: 50.w,
      // messageInsetsVertical: 10,
      messageBorderRadius: 8,
      primaryColor: colorScheme(context).primary,
      // receivedMessageDocumentIconColor: Colors.yellow,
      sendButtonMargin: EdgeInsets.zero,

      // send

      // attachmentButtonIcon: const SvgIcon(
      //   IconsAssets.smile,
      //   height: 40,
      //   width: 10,
      // ),
      backgroundColor: colorScheme(context).background,

      // attachmentButtonMargin: EdgeInsets.only(left: 10),
      inputTextColor: Colors.black,

      inputMargin: const EdgeInsets.symmetric(horizontal: 10),
      inputPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      inputBorderRadius: BorderRadius.circular(7),
      inputTextStyle: textTheme(context).bodyText2!,

      inputContainerDecoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurStyle: BlurStyle.solid,
          blurRadius: 2,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(6), color: Colors.white),

      // inputBackgroundColor: ColorsConst.white,
      inputTextDecoration: InputDecoration(
          fillColor: ColorsConst.white,
          filled: true,
          // suffixIcon: SizedBox(
          //         width: 100,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             InkWell(
          //                 onTap: () {
          //                   print("photo");
          //                 },
          //                 child: const SvgIcon(IconsAssets.photo)),
          //             const SvgIcon(IconsAssets.upload),
          //             const SvgIcon(IconsAssets.audio),
          //             const SizedBox(
          //               width: 1,
          //             ),
          //           ],
          //         ),
          //       ),

          // floatingLabelBehavior: FloatingLabelBehavior.auto,
          // labelText: hintText,
          // labelStyle:
          //     textTheme(context).caption?.copyWith(color: Colors.black),

          // prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
              borderRadius: replymessage != ""
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    )
                  : miniBoxCornerRadius,
              borderSide: const BorderSide(color: ColorsConst.white, width: 1)),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: replymessage != ""
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    )
                  : miniBoxCornerRadius,
              borderSide: const BorderSide(color: ColorsConst.white, width: 1)),

          // errorText: "faliure",
          hintStyle: textTheme(context).caption),
    );
  }
}

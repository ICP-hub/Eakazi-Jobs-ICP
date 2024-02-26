import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../../../constants/assets/images_constants.dart';
import '../../../constants/theme/color_selection.dart';
import '../../../helpers/routes/app_pages.dart';
import '../../../integrations.dart';
import '../../authentication/login/view/screen/sign_in.dart';

class EmpNavDrawer extends StatelessWidget {
  Future<String> getName() async {
    var fullName = await newActor!.getFunc(FieldsMethod.getFullName)?.call([]);
    return fullName;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: ColorsConst.backgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(ImageAssets.studentImage),
                          radius: 25,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FutureBuilder<String>(
                                future: getName(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text(
                                      'Loading...', // You can replace this with a more appropriate loading message
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text(
                                      'Error: ${snapshot.error}',
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      snapshot.data ?? "User",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }
                                },
                              ),
                              FutureBuilder<String>(
                                future: getName(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text(
                                      'Loading...', // You can replace this with a more appropriate loading message
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text(
                                      'Error: ${snapshot.error}',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      "${snapshot.data}@email.com" ??
                                          "user@email.com",
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black.withOpacity(0.5),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: _buildDrawerItem(Icons.home, 'Home', context),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.flChatList);
                    },
                    child: _buildDrawerItem(
                        Icons.message, 'Messages', context, '1'),
                  ),
                  GestureDetector(
                    child: _buildDrawerItem(Icons.work, 'My Jobs', context),
                    onTap: () {
                      Get.toNamed(Routes.employerJobs);
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.walletHome);
                    },
                    child: _buildDrawerItem(
                        Icons.account_balance_wallet, 'My Wallet', context),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.alerts);
                    },
                    child: _buildDrawerItem(
                        Icons.notifications, 'Notifications', context, '1'),
                  ),
                  GestureDetector(
                    child: _buildDrawerItem(Icons.person, 'Profile', context),
                    onTap: () {
                      Get.toNamed(Routes.employerProfile);
                    },
                  ),
                  SizedBox(height: 90.sp),
                  GestureDetector(
                    child: _buildDrawerItem(Icons.logout, 'Logout', context),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  GestureDetector(
                    child: _buildDrawerItem(
                        Icons.share, 'Invite a Friend', context),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, BuildContext context,
      [String? notificationCount]) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title:
      Text(title, style: TextStyle(color: Colors.black, fontSize: 10.sp)),
      trailing: notificationCount != null
          ? Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(50),
        ),
        constraints: BoxConstraints(
          minWidth: 26,
          minHeight: 6,
        ),
        child: Text(
          notificationCount,
          style: TextStyle(
            color: Colors.white,
            fontSize: 8.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      )
          : null,
    );
  }
}

import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/input_voucher/items/item_voucher_vertical.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_list_riwayat.dart';
import 'package:ayamku_delivery/app/pages/features/profile_page/items/item_profile_vertical.dart';
import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/auth/model/userResponse.dart';
import '../../../router/app_pages.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: txtTitlePage.copyWith(color: blackColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderProfile(),
                SizedBox(
                  height: 60,
                ),
                ItemProfileVertical(),
                SizedBox(
                  height: 40,
                ),
                controller.token != null
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => Get.toNamed(Routes.LOGIN_PAGE),
                            icon: Icon(Icons.logout, color: errorColor),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Logout",
                            style: txtFormTitle.copyWith(color: errorColor),
                          )
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderProfile extends GetView<ProfilePageController> {
  const HeaderProfile({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            controller.user.value.profilePicture != null
                ? controller.user.value.profilePicture.toString()
                : 'https://i.imgflip.com/6yvpkj.jpg',
          ),
        ),

        SizedBox(
          width: 15,
        ),
        controller.token != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.user.name ?? '',
                    style: txtHeadline3.copyWith(color: blackColor),
                  ),
                  Text(
                    controller.user.email ?? '',
                    style: txtCaption.copyWith(color: blackColor),
                  ),
                  Text(
                    controller.user.phoneNumber ?? '',
                    style: txtCaption.copyWith(color: blackColor),
                  ),
                ],
              )
            : Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FullBtn(
                        text: "Login",
                        onTap: () {
                          Get.toNamed(Routes.LOGIN_PAGE);
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    LittleButton(
                        text: "Daftar",
                        onTap: () {
                          Get.toNamed(Routes.REGISTER_PAGE);
                        })
                  ],
                ),
            ),

      ],
    );
    });
    
  }
}

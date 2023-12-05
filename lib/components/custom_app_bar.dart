import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_avatar.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/controllers/dashboard_controller.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onTap;
  final bool withTrailing;
  final EdgeInsets? padding;
  const CustomAppBar(
      {Key? key, this.onTap, this.withTrailing = true, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) => ListTile(
        contentPadding: padding,
        leading: (withTrailing) ? GestureDetector(
          onTap: onTap,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: SvgPicture.asset(IconAssets.menu),
          ),
        ) : null,
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: (withTrailing) ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                color: Colors.white,
                fontSize: 20,
                text: controller.userController.currentUser.name!.capitalize!,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(width: 8),
              CustomAvatar(
                height: 44,
                width: 44,
                image: controller.userController.currentUser.image,
                hasMedia: controller.userController.currentUser.hasMedia!,
              ),
            ],
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAvatar(
                height: 44,
                width: 44,
                image: controller.userController.currentUser.image,
                hasMedia: controller.userController.currentUser.hasMedia!,
              ),
              SizedBox(width: 8),
              CustomText(
                color: Colors.white,
                fontSize: 20,
                text: controller.userController.currentUser.name!.capitalize!,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
        // subtitle: CustomText(
        //   color: vodkaColor,
        //   fontSize: 17,
        //   text:
        //       '${ConstantTexts.morning.tr} ${controller.userController.currentUser.firstName.capitalize}!',
        //   textAlign: TextAlign.left,
        //   fontWeight: FontWeight.w100,
        // ),
      ),
    );
  }
}

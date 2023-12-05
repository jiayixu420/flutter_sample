import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_nation/components/custom_drawer.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/assets/draw_assets.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/master_classes_controller.dart';
import 'package:happy_nation/layouts/draw.dart';
import 'package:happy_nation/layouts/master.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/screens/user/master_classes/parts/grid_video.dart';
import 'package:happy_nation/screens/user/master_classes/parts/master_classes_loader.dart';

class MasterClassesScreen extends StatelessWidget {
  const MasterClassesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MasterClassesController>(
      init: MasterClassesController(),
      builder: (controller) => CustomDrawer(
        zoomDrawerController: controller.zoomDrawerController,
        mainScreen: MasterLayout(
          appBar: true,
          hasBackArrow: true,
          safeAreaTop: Platform.isAndroid,
          backgroundImg: MainAssets.background,
          drawLayout: true,
          imgPath: DrawAssets.draw10Svg,
          drawHeight: 190.05,
          drawWidth: 445,
          drawMarginTop: 2,
          rectangleHeight: 646,
          onTap: () => Get.back(),
          onTapMenu: () => controller.toggleDrawer(),
          bottomWidget: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 35.h,
                ),
                const DrawLayout(
                  imgPath: IconAssets.video,
                  height: 57.24,
                  width: 63.25,
                  marginTop: 0,
                  marginBottom: 6,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 12.76.h,
                    bottom: 31.h,
                  ),
                  child: CustomText(
                    color: grayColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    text: ConstantTexts
                        .knowledgeIsPowerKeepOnCultivatingHappiness.tr,
                    // text: 'Masterclasses',
                  ),
                ),
                controller.isLoading.value
                    ? SizedBox(
                        height: 250.h,
                        child: const MasterClassesLoader(),
                      )
                    : GridVideo(
                        videos: controller.videos,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

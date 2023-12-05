import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/language_controller.dart';
import 'package:happy_nation/components/menu_item.dart' as mitem;

import 'custom_text.dart';
import 'menu_item_widget.dart';

class LangDialogWidget extends StatelessWidget {
  const LangDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      init: LanguageController(),
      builder: (controller) => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: Container(
            width: 328.w,
            height: 359.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Material(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 10.sp,
                        ),
                        width: 27.h,
                        height: 27.h,
                        child: Icon(
                          Icons.close_rounded,
                          size: 35.sp,
                          color: hex('CAD2DC'),
                        ),
                      ),
                    ),
                  ),
                  CustomText(
                    color: grayColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    text: ConstantTexts.chooseYourLanguage.tr,
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
                    child: MenuItemWidget(
                      onTap: () => controller.selectedLang('fr'),
                      item: mitem.MenuItem(
                        ConstantTexts.frensh.tr,
                        IconAssets.frFlag,
                      ),
                      withIcon: controller.selected.value == 'fr',
                      iconData: Icons.check,
                      iconColor: hex('49F997'),
                      txtColor: grayColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
                    child: MenuItemWidget(
                      onTap: () => controller.selectedLang('en'),
                      item: mitem.MenuItem(
                        ConstantTexts.english.tr,
                        IconAssets.enFlag,
                      ),
                      withIcon: controller.selected.value == 'en',
                      iconData: Icons.check,
                      iconColor: hex('49F997'),
                      txtColor: grayColor,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: controller.confirmSelectedLang,
                        child: SvgPicture.asset(
                          IconAssets.checkIcon,
                          height: 48.sp,
                          width: 48.sp,
                        ),
                      ),
                      SizedBox(width: 51.w),
                      InkWell(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          IconAssets.closeIcon,
                          height: 48.sp,
                          width: 48.sp,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

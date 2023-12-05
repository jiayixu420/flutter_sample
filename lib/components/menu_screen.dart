import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_app_bar.dart';
import 'package:happy_nation/components/html_compenent.dart';
import 'package:happy_nation/components/menu_item.dart' as mitem;
import 'package:happy_nation/components/menu_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/constants/html/terms.dart';
import 'package:happy_nation/constants/html/privacy.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/menu_controller.dart';

import 'language_component.dart';

class MenuScreen extends StatelessWidget {
  final VoidCallback? onTap;
  const MenuScreen({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController2>(
      init: MenuController2(),
      builder: (controller) => Scaffold(
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(MainAssets.background),
            ),
          ),
          padding: EdgeInsets.only(
            left: 5.w,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.h,
                      bottom: 20.h,
                      left: 5.w,
                    ),
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: onTap,
                      child: Icon(
                        Icons.close_sharp,
                        size: 30.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CustomAppBar(
                    // onTap: onTap,
                    withTrailing: false,
                    padding: EdgeInsets.only(left: 5.w),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  MenuItemWidget(
                    onTap: () => Get.toNamed('/change-password'),
                    item: mitem.MenuItem(
                      ConstantTexts.settings.tr,
                      IconAssets.settings,
                    ),
                  ),
                  const LanguageComponent(),
                  MenuItemWidget(
                    item: mitem.MenuItem(
                      ConstantTexts.privateNotice.tr,
                      IconAssets.privateNotice,
                    ),
                    onTap: () => Get.dialog(
                        const HtmlComponent(data: PrivacyHtml.htmlTerm)),
                  ),
                  MenuItemWidget(
                    item: mitem.MenuItem(
                      ConstantTexts.termsOfUses.tr,
                      IconAssets.termsOfUses,
                    ),
                    onTap: () => Get.dialog(
                        const HtmlComponent(data: TermsHtml.htmlTerm)),
                  ),
                  MenuItemWidget(
                    item: mitem.MenuItem(
                      ConstantTexts.logout.tr,
                      IconAssets.logout,
                    ),
                    onTap: () => controller.userController.logOut(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

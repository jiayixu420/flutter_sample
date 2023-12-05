import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/components/menu_item.dart' as mitem;
import 'package:happy_nation/controllers/language_controller.dart';

import 'menu_item_widget.dart';

class LanguageComponent extends StatelessWidget {
  const LanguageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      init: LanguageController(),
      builder: (controller) => Column(
        children: [
          MenuItemWidget(
            onTap: controller.expandLanguageList,
            item: mitem.MenuItem(
              ConstantTexts.languages.tr,
              IconAssets.translate,
            ),
            withIcon: true,
            iconData: controller.expanded
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
          ),
          controller.expanded
              ? ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    MenuItemWidget(
                      onTap: () => controller.setLanguage('fr'),
                      item: mitem.MenuItem(
                        ConstantTexts.frensh.tr,
                        IconAssets.frFlag,
                      ),
                      withIcon: !controller.isEN,
                      iconData: Icons.check,
                      iconColor: hex('49F997'),
                    ),
                    MenuItemWidget(
                      onTap: () => controller.setLanguage('en'),
                      item: mitem.MenuItem(
                        ConstantTexts.english.tr,
                        IconAssets.enFlag,
                      ),
                      withIcon: controller.isEN,
                      iconData: Icons.check,
                      iconColor: hex('49F997'),
                    ),
                  ],
                )
              : const SizedBox(height: 0)
        ],
      ),
    );
  }
}

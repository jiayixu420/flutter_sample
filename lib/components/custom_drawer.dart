import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/menu_screen.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/controllers/menu_controller.dart';

class CustomDrawer extends StatelessWidget {
  final Widget mainScreen;
  final ZoomDrawerController zoomDrawerController;
  const CustomDrawer({
    Key? key,
    required this.mainScreen,
    required this.zoomDrawerController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController2>(
      init: MenuController2(),
      global: false,
      builder: (controller) => ZoomDrawer(
        controller: zoomDrawerController,
        style: DrawerStyle.Style1,
        menuScreen: MenuScreen(
          onTap: () => zoomDrawerController.close!(),
        ),
        mainScreen: mainScreen,
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        shadowLayer1Color: Colors.white.withOpacity(.4),
        shadowLayer2Color: Colors.white.withOpacity(.6),
        backgroundColor: metallicSunburstColor,
        slideWidth: MediaQuery.of(context).size.width * .60,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }
}

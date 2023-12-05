import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:happy_nation/controllers/dashboard_controller.dart';
import 'package:happy_nation/layouts/draw.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) => CarouselSlider(
        items: List.generate(
          controller.sliderList.length,
          (index) => Center(
            child: Opacity(
              opacity: controller.sliderImage.value.id ==
                      controller.sliderList.elementAt(index).id
                  ? 1
                  : .7,
              child: GestureDetector(
                child: SvgPicture.asset(
                  controller.sliderList.elementAt(index).image!,
                  fit: BoxFit.contain,
                ),
                onTap: () => controller.onTap(),
              )
              /*DrawLayout(
                imgPath: controller.sliderList.elementAt(index).image,
                height: controller.sliderList.elementAt(index).size!.height,
                width: controller.sliderList.elementAt(index).size!.width,
                marginTop: 22,
                marginBottom: 6,
                onTap: () => controller.onTap(),
              )*/,
            ),
          ),
        ),
        carouselController: controller.buttonCarouselController,
        options: CarouselOptions(
          enlargeCenterPage: false,
          viewportFraction: .33,
          aspectRatio: 1,
          onPageChanged: (index, change) => controller.onPageChanged(index),
        ),
      ),
    );
  }
}

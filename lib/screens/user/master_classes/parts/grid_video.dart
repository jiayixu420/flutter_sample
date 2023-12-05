import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/models/route_argument.dart';
import 'package:happy_nation/models/video.dart';
import 'package:happy_nation/screens/user/master_classes/parts/thumb_component.dart';
import 'package:happy_nation/screens/user/master_classes/parts/video_component.dart';
import 'package:responsive_grid/responsive_grid.dart';

class GridVideo extends StatelessWidget {
  final List<Video> videos;
  const GridVideo({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      scroll: false,
      desiredItemWidth: (MediaQuery.of(context).size.width <= 480) ? 180.w : 80.w,
      minSpacing: 18.h,
      children: List.generate(
        videos.length,
        (index) => InkWell(
          onTap: () {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]);
            Get.dialog(
              VideoScreen(
                routeArgument: RouteArgument(
                  param: videos.elementAt(index).video,
                ),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ThumbComponent(path: videos.elementAt(index).thumb!),
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: videos.elementAt(index).name!,
                  fontSize: 18,
                  color: grayColor,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

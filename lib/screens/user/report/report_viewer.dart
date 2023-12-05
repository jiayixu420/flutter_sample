import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/controllers/dashboard_controller.dart';
import 'package:happy_nation/layouts/back_arrow.dart';
import 'package:happy_nation/models/route_argument.dart';

class ReportViewer extends StatelessWidget {
  final RouteArgument? routeArgument;
  const ReportViewer({Key? key, this.routeArgument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: false,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GetBuilder<DashboardController>(
                init: DashboardController(),
                builder: (controller) => PDFViewer(
                  document: controller.doc!,
                  scrollDirection: Axis.vertical,
                  showPicker: false,
                ),
              ),
            ),
            BackArrow(
              onTap: () => Get.back(),
              top: 15,
              bottom: null,
              left: 10,
            ),
          ],
        ),
      ),
    );
  }
}

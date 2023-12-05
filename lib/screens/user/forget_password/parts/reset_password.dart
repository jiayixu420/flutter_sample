import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/forget_password_controller.dart';
import 'package:happy_nation/helpers/loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ForgotPasswordController>(
        init: ForgotPasswordController(),
        builder: (controller) => Scaffold(
          resizeToAvoidBottomInset: true,
          extendBody: true,
          appBar: AppBar(
            backgroundColor: blueColor,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.offAllNamed('/login'),
            ),
            title: CustomText(
              text: ConstantTexts.resetPassword.tr,
              fontSize: 25.h,
              color: Colors.white,
            ),
          ),
          body: WebView(
            initialUrl: controller.resetLink,
            onPageStarted: (url) {
              Loading.open();
              if (!url.split('/').contains('password')) {
                Get.offAllNamed('/login');
              }
            },
            onPageFinished: (url) {
              Loading.close();
            },
          ),
        ),
      ),
    );
  }
}

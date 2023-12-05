import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final double height;
  final double? width;
  final double? horizontal;
  final double? vertical;
  final EdgeInsetsGeometry padding;
  final String placeholder;
  final bool obscureText;
  final bool readOnly;
  final Color? fillColor;
  final TextAlign textAlign;
  final Widget? rightIcon;
  final Widget? leftIcon;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? initialValue;
  final TextInputType? keyboardType;
  const CustomTextField({
    Key? key,
    this.height = 48,
    this.placeholder = "",
    this.fillColor,
    this.rightIcon,
    this.leftIcon,
    this.width = 352,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.padding = EdgeInsets.zero,
    this.onSaved,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.controller,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.horizontal = 38,
    this.vertical = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: EdgeInsets.symmetric(
        horizontal: horizontal!.w,
        vertical: vertical!.h,
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        initialValue: initialValue,
        controller: controller,
        onTap: onTap,
        readOnly: readOnly,
        onSaved: onSaved,
        validator: validator,
        textAlign: textAlign,
        obscureText: obscureText,
        style: TextStyle(fontSize: 14.sp, color: hex("#9B9DB6")),
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
          suffixIcon: rightIcon,
          prefixIcon: leftIcon,
          // constraints: BoxConstraints.expand(height: height.h, width: width?.h),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
          hintText: placeholder,
          hintStyle: TextStyle(
              color: hex("#97A5B8"),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
          fillColor: hex("#EAF0F8"),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50.h),
          ),
        ),
      ),
    );
  }
}

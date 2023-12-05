import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:division/division.dart';

import 'cutom_drop_down_icon.dart';

class CustomDropDown extends StatelessWidget {
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
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;

  const CustomDropDown({
    Key? key,
    this.height = 48,
    this.placeholder = "",
    this.fillColor,
    this.rightIcon,
    this.leftIcon,
    this.width,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.padding = EdgeInsets.zero,
    this.onSaved,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.controller,
    this.initialValue,
    required this.items,
    required this.onChanged,
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
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          isDense: true,
          isExpanded: true,
          items: items,
          onChanged: onChanged,
          iconSize: 40.r,
          icon: const CustomDropDownIcon(),
          // icon: const Visibility(visible: false, child: SizedBox()),
          style: TextStyle(fontSize: 14.sp, color: hex("#9B9DB6")),
          decoration: InputDecoration(
            errorStyle: const TextStyle(height: 0),
            // suffixIcon: rightIcon,
            prefixIcon: leftIcon,
            // constraints: BoxConstraints.expand(height: height.h, width: width?.h),
            contentPadding: EdgeInsets.zero,
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
          // validator: validator,
        ),
      ),
    );
  }
}

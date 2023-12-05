import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/components/menu_item.dart' as mitem;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuItemWidget extends StatelessWidget {
  final mitem.MenuItem? item;
  final VoidCallback? onTap;
  final bool? selected;
  final bool withIcon;
  final IconData iconData;
  final Color iconColor;
  final Color txtColor;

  final white = Colors.white;

  const MenuItemWidget({
    Key? key,
    this.item,
    this.onTap,
    this.selected = false,
    this.withIcon = false,
    this.iconData = Icons.keyboard_arrow_down,
    this.iconColor = Colors.white,
    this.txtColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        primary: selected! ? const Color(0x44000000) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 42.h,
            width: 42.w,
            child: SvgPicture.asset(
              item!.icon,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          CustomText(
            textAlign: TextAlign.left,
            text: item!.title,
            fontSize: 16,
            color: txtColor,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            width: withIcon ? 5.0 : 0,
          ),
          withIcon
              ? Icon(
                  iconData,
                  color: iconColor,
                  size: 20.sp,
                )
              : const SizedBox(width: 0)
        ],
      ),
    );
  }
}

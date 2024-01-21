import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/text_styles.dart';

class ItemInfoWeather extends StatelessWidget {
  const ItemInfoWeather({
    super.key,
    required this.iconPath,
    required this.itemText,
  });

  final String iconPath;
  final String itemText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
            // height: 20.h,
          ),
          SizedBox(width: 5.w),
          Text(itemText, style: TextStyles.fontStyles(fontSize: 13.sp)),
        ],
      ),
    );
  }
}

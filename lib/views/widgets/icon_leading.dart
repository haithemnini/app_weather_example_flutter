import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_trackr/core/helpers/extensions.dart';

class IconLeading extends StatelessWidget {
  const IconLeading({
    super.key,
    required this.onTap,
    this.isBackButton = false,
  });

  final void Function() onTap;
  final bool isBackButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.0.w),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          margin: EdgeInsets.only(left: 10.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isBackButton
                  ? context.colorScheme.onBackground
                  : Colors.white,
              width: 1.5.w,
            ),
          ),
          child: isBackButton
              ? const Icon(Icons.arrow_back_ios_new_rounded, size: 15)
              : const Icon(Icons.menu, size: 18, color: Colors.white),
        ),
      ),
    );
  }
}

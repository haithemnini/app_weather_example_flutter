import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_trackr/core/helpers/text_styles.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            title,
            style: TextStyles.fontStyles(fontSize: 14.sp, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

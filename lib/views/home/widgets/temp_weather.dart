import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/blocs.dart';
import '../../../core/helpers/text_styles.dart';

class TempWeather extends StatelessWidget {
  const TempWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final response = state.maybeWhen(
          success: (success) => success,
          orElse: () => null,
        );

        return Align(
          alignment: Alignment.center,
          child: Text(
            '${response?.current.temp.round() ?? '--'}' '°',
            style: TextStyles.fontStyles(fontSize: 120.sp),
          ),
        );
      },
    );
  }
}

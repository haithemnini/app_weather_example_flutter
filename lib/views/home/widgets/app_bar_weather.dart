import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_trackr/controller/blocs.dart';
import 'package:weather_trackr/core/helpers/extensions.dart';
import '../../../core/helpers/text_styles.dart';
import '../../../core/routing/routing.dart';
import '../../widgets/icon_leading.dart';
import 'widgets.dart';

class AppBarWeather extends StatelessWidget {
  const AppBarWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      excludeHeaderSemantics: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      title: _buildTitle(context),
      leading: IconLeading(onTap: () => context.pushNamed(Routes.settings)),
      actions: const [RefreshIconWeather()],
    );
  }

  // @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Builds the title widget for the app bar.
Widget _buildTitle(BuildContext context) {
  return Center(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_buildTextTimeZone(), _buildTextDateCruuent()],
        ),
      ],
    ),
  );
}

// Builds the time zone text widget for the app bar.
Widget _buildTextTimeZone() {
  return BlocBuilder<WeatherCubit, WeatherState>(
    builder: (context, state) {
      final success = state.maybeWhen(
        success: (success) => success,
        orElse: () => null,
      );

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_on_rounded,
            color: Colors.white,
            size: 16,
          ),
          SizedBox(width: 4.w),
          Text(
            success != null
                ? context.read<WeatherCubit>().getAddressDetails()
                : '',
            style: TextStyles.fontStyles(fontSize: 13.sp),
          ),
        ],
      );
    },
  );
}

// Builds the current date text widget for the app bar.
Widget _buildTextDateCruuent() {
  return BlocBuilder<WeatherCubit, WeatherState>(
    builder: (context, state) {
      final success = state.maybeWhen(
        success: (success) => success,
        orElse: () => null,
      );
      return Text(
        success != null ? success.current.dt.convertToDayToday() : '',
        style: TextStyles.fontStyles(fontSize: 12.sp),
      );
    },
  );
}

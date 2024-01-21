import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_trackr/core/helpers/extensions.dart';

import '../../core/helpers/enum.dart';
import '../../core/helpers/system_ui_overlay_config.dart';
import '../widgets/icon_leading.dart';
import 'widgets/units_weather.dart';

class DetailsSettingsView extends StatelessWidget {
  const DetailsSettingsView({super.key, required this.configSettings});

  final ConfigSettings configSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        configSettings.name,
        style: const TextStyle().copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
      ),
      leading: IconLeading(onTap: () => context.pop(), isBackButton: true),
      systemOverlayStyle: SystemUiOverlayConfig.systemUiOverlayAppBar(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: _switchDetailsSetting(context),
      ),
    );
  }

  /// Switch the details setting based on the current [ConfigSettings]
  Widget _switchDetailsSetting(BuildContext context) {
    switch (configSettings) {
      case ConfigSettings.units:
        return const UnitsWeather();
      default:
        return const Placeholder();
    }
  }
}

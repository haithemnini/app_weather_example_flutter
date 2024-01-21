import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_trackr/controller/blocs.dart';
import 'package:weather_trackr/core/helpers/extensions.dart';

import '../../core/helpers/enum.dart';
import '../../core/helpers/system_ui_overlay_config.dart';
import '../../core/routing/routing.dart';
import '../widgets/icon_leading.dart';
import 'widgets/swith_theme_icon.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  void initState() {
    // Get the current theme mode
    context.read<ThemesCubit>().getCurrentThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconLeading(onTap: () => context.pop(), isBackButton: true),
        systemOverlayStyle:
            SystemUiOverlayConfig.systemUiOverlayAppBar(context),
      ),
      body: _buildBody(context),
    );
  }

  // Build the body of the view with the list of settings
  _buildBody(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
        child: Column(
          children: [
            // Switch theme icon
            const SwithThemeIcon(),
            // Units list tile
            _buildListTile(context, 'Units', ConfigSettings.units),
          ],
        ),
      ),
    );
  }

  // Build the list tile of the settings view with the title and the icon
  Widget _buildListTile(
    BuildContext context,
    String title,
    ConfigSettings configSettings,
  ) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.detailsSettings,
        arguments: configSettings,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}

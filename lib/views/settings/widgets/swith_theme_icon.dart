import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/blocs.dart';

class SwithThemeIcon extends StatefulWidget {
  const SwithThemeIcon({super.key});

  @override
  State<SwithThemeIcon> createState() => _SwithThemeIconState();
}

class _SwithThemeIconState extends State<SwithThemeIcon> {
  late bool isThemeMode;

  @override
  void initState() {
    isThemeMode = context.read<ThemesCubit>().state.maybeMap(
          loaded: (state) => state.themeMode == ThemeMode.dark,
          orElse: () => false,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemesState>(
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            isThemeMode ? Icons.dark_mode : Icons.light_mode,
            color: isThemeMode ? Colors.white : Colors.black,
          ),
          title: Text(
            isThemeMode ? 'Dark Theme' : 'Light Theme',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: Switch(
            activeColor: Colors.grey[200],
            inactiveTrackColor: Colors.grey[300],
            inactiveThumbColor: Colors.grey[100],
            value: isThemeMode,
            onChanged: (themeMode) {
              setState(
                () {
                  isThemeMode = themeMode;
                  context.read<ThemesCubit>().themesChanged(themeMode);
                },
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_trackr/core/helpers/extensions.dart';

import '../controller/blocs.dart';
import '../core/di/get_it.dart';
import '../core/routing/routing.dart';
import '../core/theming/theming.dart';

class WeatherTrackr extends StatelessWidget {
  const WeatherTrackr({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    context.systemUiOverlay();
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => getIt<ThemesCubit>()..getCurrentThemeMode(),
        child: BlocBuilder<ThemesCubit, ThemesState>(
          builder: (context, state) {
            final bool isDarkTheme = state.maybeMap(
              loaded: (state) => state.themeMode == ThemeMode.dark,
              orElse: () => false,
            );

            return MaterialApp(
              title: 'Weather App',
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
              initialRoute: Routes.home,
              onGenerateRoute: appRouter.generateRoute,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}

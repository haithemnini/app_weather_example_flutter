import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/blocs.dart';
import '../../../core/helpers/enum.dart';

class UnitsWeather extends StatefulWidget {
  const UnitsWeather({super.key});

  @override
  State<UnitsWeather> createState() => _UnitsWeatherState();
}

class _UnitsWeatherState extends State<UnitsWeather> {
  @override
  void initState() {
    // Get the current units
    context.read<WeatherCubit>().getUnits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final units = state.maybeMap(
          changedUnits: (_) => _,
          orElse: () => null,
        );
        return Column(
          children: [
            ...Units.values.map(
              (itemUnits) => ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () =>
                    context.read<WeatherCubit>().changeUnits(itemUnits.index),
                title: Padding(
                  padding: EdgeInsets.only(left: 5.0.w),
                  child: Text(
                    itemUnits.name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                trailing: units != null && units.units == itemUnits.index
                    ? Padding(
                        padding: EdgeInsets.only(right: 5.0.w),
                        child: const Icon(Icons.check_circle_rounded),
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}

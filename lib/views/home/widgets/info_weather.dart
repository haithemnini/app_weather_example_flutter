import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_trackr/controller/blocs.dart';

import 'package:weather_trackr/model/weather_response.dart';
import 'widgets.dart';

class InfoWeather extends StatelessWidget {
  const InfoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) => state.maybeWhen(
        success: (success) => _buildCardInfo(success),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }

  Container _buildCardInfo(WeatherResponse success) {
    return Container(
      width: double.infinity,
      color: Colors.red.withOpacity(0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItemsInfo(
              items: [
                ItemInfoWeather(
                  iconPath: 'assets/svgs/thermostat.svg',
                  itemText: 'Feels like ${success.current.feelsLike.round()}°',
                ),
                ItemInfoWeather(
                  iconPath: 'assets/svgs/partly_cloudy_day.svg',
                  itemText: '${success.current.weather[0].main} Sky',
                ),
              ],
            ),
            _buildItemsInfo(
              items: [
                ItemInfoWeather(
                  iconPath: 'assets/svgs/air.svg',
                  itemText: '${success.current.windSpeed} m/s  ',
                ),
                ItemInfoWeather(
                  iconPath: 'assets/svgs/beach_access.svg',
                  itemText: 'UV ${success.current.uvi.round()}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildItemsInfo({required final List<ItemInfoWeather> items}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
  }
}

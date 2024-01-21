import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_trackr/core/helpers/extensions.dart';
import '../../../core/helpers/images_weather.dart';
import '../../../core/helpers/text_styles.dart';
import '../../../model/weather_response.dart';
import 'widgets.dart';

class NextDaysWeather extends StatelessWidget {
  const NextDaysWeather({Key? key, this.response}) : super(key: key);

  final WeatherResponse? response;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleCard(title: 'Next 7 days'),
        SizedBox(height: 12.h),
        _buildListWeather(),
        SizedBox(height: 12.h),
      ],
    );
  }

  //list view with the weather
  SizedBox _buildListWeather() {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: response!.daily.length - 1,
        itemBuilder: (context, index) => _buildWeatherItem(context, index),
      ),
    );
  }

  //item of the list view with the weather
  Container _buildWeatherItem(BuildContext context, int index) {
    final dayIndex = index + 1;
    final dailyData = response!.daily[dayIndex];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 5.h),
          ImagesWeather.iconWeather(dailyData.weather[0]),
          SizedBox(width: 10.h),
          Text(
            '${dailyData.temp.day.toInt()}°',
            style: TextStyles.fontStyles(fontSize: 20.sp, color: Colors.black),
          ),
          SizedBox(width: 8.h),
          Text(
            dailyData.dt.convertToWeekDay(),
            style: TextStyles.fontStyles(
              fontSize: 12.sp,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(width: 5.h),
        ],
      ),
    );
  }
}

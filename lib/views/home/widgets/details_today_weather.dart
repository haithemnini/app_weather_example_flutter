import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_trackr/core/helpers/extensions.dart';

import '../../../core/helpers/text_styles.dart';
import '../../../model/weather_response.dart';
import 'widgets.dart';

class DetailsTodayWeather extends StatelessWidget {
  const DetailsTodayWeather({super.key, this.response});

  final WeatherResponse? response;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(thickness: 0.3, height: 0),
        // dvider line

        SizedBox(height: 14.h),
        // title Card
        const TitleCard(title: 'Details'),
        SizedBox(height: 14.h),
        // Sunrise && sunset
        _buildItemInfoWeather(
          titleOne: 'Sunrise',
          valueOne: response!.current.sunrise.convertToTime(),
          titleTwo: 'Sunset',
          valueTwo: response!.current.sunset.convertToTime(),
        ),
        // Precipitation  && Humidity
        _buildItemInfoWeather(
          titleOne: 'Precipitation',
          valueOne: '${response!.current.dewPoint}%',
          titleTwo: 'Humidity',
          valueTwo: '${response!.current.humidity}%',
        ),
        // Pressure && Wind
        _buildItemInfoWeather(
          titleOne: 'Pressure',
          valueOne: '${response!.current.pressure} hPa',
          titleTwo: 'Wind',
          valueTwo: '${response!.current.windSpeed} km/h',
        ),
      ],
    );
  }

  Padding _buildItemInfoWeather({
    required String titleOne,
    required String valueOne,
    required String titleTwo,
    required String valueTwo,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCardDetailsWeather(title: titleOne, value: valueOne),
          _buildCardDetailsWeather(title: titleTwo, value: valueTwo),
        ],
      ),
    );
  }

  Expanded _buildCardDetailsWeather({
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        //height: 70.h,
        margin: EdgeInsets.symmetric(horizontal: 4.0.w),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(22.r),
        //   border: Border.all(color: Colors.grey, width: 0.3.w),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 12.0.h),
                child: Text(
                  title,
                  style: TextStyles.fontStyles(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.h),
              child: Text(
                value,
                style: TextStyles.fontStyles(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

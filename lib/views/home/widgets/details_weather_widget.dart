import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_trackr/controller/blocs.dart';
import 'package:weather_trackr/views/home/widgets/widgets.dart';

class DetailsWeatherWidget extends StatelessWidget {
  const DetailsWeatherWidget({
    Key? key,
    // this.response,
  }) : super(key: key);

  // final WeatherResponse? response;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) => state.maybeWhen(
        success: (weather) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //next 7 days weather
            NextDaysWeather(response: weather),
            //Details weather today
            DetailsTodayWeather(response: weather),
          ],
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}

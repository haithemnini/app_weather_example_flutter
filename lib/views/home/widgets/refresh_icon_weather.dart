import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/blocs.dart';

class RefreshIconWeather extends StatefulWidget {
  const RefreshIconWeather({Key? key}) : super(key: key);

  @override
  State<RefreshIconWeather> createState() => _RefreshIconWeatherState();
}

class _RefreshIconWeatherState extends State<RefreshIconWeather>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  // onPressedEnabled is used to disable the onPressed function of the button when the weather is fetching or refreshing
  bool isPressedEnabled = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // This function is used to handle the refresh of the weather when the button is pressed
  void handleRefresh() {
    if (isPressedEnabled) {
      context.read<WeatherCubit>().refreshWeather();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      // This bloc builder is used to start the animation when the weather is refreshing and stop it when it is not
      buildWhen: (previous, current) =>
          previous.maybeWhen(
            refresh: () => true,
            orElse: () => false,
          ) !=
          current.maybeWhen(
            refresh: () => true,
            orElse: () => false,
          ),
      builder: (context, state) {
        // This bloc builder is used to start the animation when the weather is refreshing and stop it when it is not
        if (state.maybeWhen(refresh: () => true, orElse: () => false)) {
          _controller.repeat();
          isPressedEnabled = false;
        } else {
          _controller.stop();
          isPressedEnabled = true;
        }

        return RotationTransition(
          turns: _animation,
          child: IconButton(
            onPressed: handleRefresh,
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
              size: 18,
            ),
          ),
        );
      },
    );
  }
}

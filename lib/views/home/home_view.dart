import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_trackr/core/helpers/extensions.dart';

import '../../controller/blocs.dart';
import './widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  /// This is the controller for the sliding panel
  // isDraggable is used to disable the drag of the panel when the weather is loading
  bool isDraggable = false;
  // isCollapsed is used to change the icon of the panel when it is collapsed or expanded
  bool isCollapsed = false;

  // This is the controller for the sliding panel
  isDraggableChange(bool value) => setState(() => isDraggable = value);
  isCollapsedChange(bool value) => setState(() => isCollapsed = value);

  // Listen to location changes
  @override
  void initState() {
    super.initState();
    // fetch weather data
    context.read<WeatherCubit>().fetchWeather();
    // Listen to location changes
    context.read<WeatherCubit>().listenLocationChanges();
    // Listen if the internet is connected or not
    context.read<WeatherCubit>().listenInternetChanges();
    // Get units from shared preferences
    context.read<WeatherCubit>().getUnits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return BlocListener<WeatherCubit, WeatherState>(
      listener: (context, state) => state.maybeWhen(
        success: (_) => isDraggableChange(true),
        error: (error) => _onError(error),
        orElse: () => null,
      ),
      child: SlidingUpPanel(
        onPanelOpened: () => isCollapsedChange(true),
        onPanelClosed: () => isCollapsedChange(false),
        collapsed: _collapsedPanelWidget(),
        body: const WeatherWidget(),
        panel: const PanelWidget(child: DetailsWeatherWidget()),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        maxHeight: context.screenHeight(0.65),
        isDraggable: isDraggable,
        backdropEnabled: true,
      ),
    );
  }

  void _onError(String errorMessage) {
    isDraggableChange(false);
    context.showToastMsg(errorMessage);
  }

  Container _collapsedPanelWidget() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.0.w),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) => state.maybeWhen(
            initial: () => _showLoading(),
            loading: () => _showLoading(),
            refresh: () => _showLoading(),
            orElse: () => _showIconDetails(),
          ),
        ),
      ),
    );
  }

  Column _showIconDetails() {
    return Column(
      children: [
        isCollapsed
            ? const Icon(Icons.keyboard_arrow_down, color: Colors.black)
            : const Icon(Icons.keyboard_arrow_up, color: Colors.black),
      ],
    );
  }

  Column _showLoading() {
    return const Column(
      children: [
        Center(
          child: SizedBox(
            height: 22.0,
            width: 22.0,
            child: CircularProgressIndicator(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_trackr/controller/blocs.dart';

class PanelWidget extends StatelessWidget {
  const PanelWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHandle(context),
        SizedBox(height: 15.h),
        childWidget(),
      ],
    );
  }

  Widget childWidget() {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (_) => child,
          error: (error) => Text(error.toString()),
          orElse: () => _showLoading(),
        );
      },
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.20,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12.0.h),
          child: Container(
            height: 5.0,
            decoration: BoxDecoration(
              color: theme.dividerColor.withAlpha(150),
              borderRadius: const BorderRadius.all(Radius.circular(2.5)),
            ),
          ),
        ),
      ),
    );
  }

  Column _showLoading() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Loading...'),
        SizedBox(height: 10.0),
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

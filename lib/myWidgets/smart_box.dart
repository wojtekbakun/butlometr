import 'package:butlometr2/consts/colors.dart';
import 'package:butlometr2/consts/dimensions.dart';
import 'package:flutter/material.dart';

getBoxColor(bool currentState) {
  Color color;
  color =
      currentState == true ? AppColors.activeColor : AppColors.inactiveColor;

  return color;
}

class MainBox extends StatelessWidget {
  final Widget child;

  const MainBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BoxSizes.boxHeight,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: const Border(
          bottom: BorderSide(
            color: AppColors.darkColor,
            width: BoxSizes.strokeSize * 2,
          ),
          right: BorderSide(
            color: AppColors.darkColor,
            width: BoxSizes.strokeSize * 2,
          ),
          top: BorderSide(
            color: AppColors.darkColor,
            width: BoxSizes.strokeSize,
          ),
          left: BorderSide(
            color: AppColors.darkColor,
            width: BoxSizes.strokeSize,
          ),
        ),
        borderRadius: BorderRadius.circular(
          BoxSizes.roundedCorners,
        ), //
      ),
      child: child,
    );
  }
}

class StatusBox extends StatelessWidget {
  final Color color;

  const StatusBox({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(
          left: BoxSizes.leftPadding,
        ),
        child: Container(
          height: BoxSizes.statusBoxHeight,
          width: BoxSizes.statusBoxHeight,
          decoration: BoxDecoration(
            color: color,
            border: const Border(
              bottom: BorderSide(
                color: AppColors.darkColor,
                width: BoxSizes.strokeSize,
              ),
              right: BorderSide(
                color: AppColors.darkColor,
                width: BoxSizes.strokeSize,
              ),
              top: BorderSide(
                color: AppColors.darkColor,
                width: BoxSizes.smallStrokeSize,
              ),
              left: BorderSide(
                color: AppColors.darkColor,
                width: BoxSizes.smallStrokeSize,
              ),
            ),
            borderRadius: BorderRadius.circular(
              BoxSizes.roundedCorners,
            ), //
          ),
        ),
      ),
    );
  }
}

class DescriptionFrame extends StatelessWidget {
  final Widget child;

  const DescriptionFrame({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: BoxSizes.boxHeight,
      child: Row(
        children: [
          const Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                left: BoxSizes.leftPadding,
              ),
              child: SizedBox(
                height: BoxSizes.statusBoxHeight,
                width: BoxSizes.statusBoxHeight,
              ),
            ),
          ),
          Expanded(flex: 8, child: child),
        ],
      ),
    );
  }
}

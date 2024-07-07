import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_test/common/app_colors.dart';
import 'package:timelines/timelines.dart';

class RegisterProcessWidget extends StatelessWidget {
  final int processIndex;
  RegisterProcessWidget({
    super.key,
    required this.processIndex,
  });

  Color getColor(int index) {
    if (index > processIndex) {
      return AppColors.grey200;
    } else {
      return AppColors.primaryColor;
    }
  }

  final List<String> processList = [
    'start',
    'Register',
    'Complete Data',
    'start'
  ];
  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        direction: Axis.horizontal,
        connectorTheme: ConnectorThemeData(
          space: 10.0.h,
          thickness: 2.0.h,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.after,
        oppositeContentsBuilder: oppositeContentsBuilder,
        contentsBuilder: (context, index) => const SizedBox.shrink(),
        indicatorBuilder: indicatorBuilder,
        connectorBuilder: connectorBuilder,
        itemCount: processList.length,
      ),
    );
  }

  Widget contentWidget(list, index, {isOpposite = false}) {
    return Container(
      alignment: Alignment.center,
      width: 140.w,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        list[index],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget? oppositeContentsBuilder(context, index) {
    if (index == 0 || index == processList.length - 1) {
      return const SizedBox(
        width: 40,
      );
    } else {
      return contentWidget(
        processList,
        index,
        isOpposite: true,
      );
    }
  }

  Widget? connectorBuilder(
      BuildContext context, int index, ConnectorType type) {
    return SolidLineConnector(color: getColor(index));
  }

  Widget? indicatorBuilder(_, index) {
    if (index == 0 || index == processList.length - 1) {
      return null;
    } else if (index > processIndex) {
      return uncheckedConnector(index);
    } else {
      return checkedConnector(index);
    }
  }

  Container uncheckedConnector(index) {
    return Container(
      width: 25.w,
      height: 25.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grey200,
        ),
      ),
      child: Text(
        index.toString(),
        style: const TextStyle(color: AppColors.primaryColor),
      ),
    );
  }

  Container checkedConnector(index) {
    return Container(
        width: 25.w,
        height: 25.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
        ),
        child: Icon(
          Icons.done,
          color: AppColors.white,
          size: 16.h,
        ));
  }
}

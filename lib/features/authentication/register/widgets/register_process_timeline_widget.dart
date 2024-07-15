import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines/timelines.dart';

import '../../../../common/app_colors.dart';

enum ProcessStatus { none, before, current, after }

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
      return AppColors.primary;
    }
  }

  ProcessStatus getCurrentStatus(index) {
    if (index == 0 || index == processList.length - 1) {
      return ProcessStatus.none;
    } else if (index == processIndex) {
      return ProcessStatus.after;
    } else if (index == processIndex + 1) {
      return ProcessStatus.current;
    } else {
      return ProcessStatus.before;
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
        oppositeContentsBuilder: (context, index) {
          if (getCurrentStatus(index) == ProcessStatus.none) {
            return const SizedBox(width: 40);
          } else {
            return contentWidget(
              processList,
              index,
            );
          }
        },
        indicatorBuilder: (_, index) {
          ProcessStatus status = getCurrentStatus(index);
          if (status == ProcessStatus.none) {
            return null;
          } else if (status == ProcessStatus.after) {
            return checkedConnector(index);
          } else if (status == ProcessStatus.current) {
            return currentConnector(index);
          } else {
            return beforeConnector(index);
          }
        },
        connectorBuilder:
            (BuildContext context, int index, ConnectorType type) {
          return SolidLineConnector(color: getColor(index));
        },
        itemCount: processList.length,
      ),
    );
  }

  Widget contentWidget(list, index) {
    return Container(
      alignment: Alignment.center,
      width: 140.w,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        list[index],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: getCurrentStatus(index) == ProcessStatus.before
              ? AppColors.grey300
              : AppColors.primary,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Container beforeConnector(index) {
    return Container(
      width: 25.w,
      height: 25.h,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.grey200,
      ),
    );
  }

  Container currentConnector(index) {
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
        style: const TextStyle(color: AppColors.primary),
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
          color: AppColors.primary,
        ),
        child: Icon(
          Icons.done,
          color: AppColors.white,
          size: 16.h,
        ));
  }
}

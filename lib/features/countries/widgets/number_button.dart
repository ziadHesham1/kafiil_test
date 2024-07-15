import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_colors.dart';

class NumberButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final bool selected;
  const NumberButton({
    super.key,
    this.onPressed,
    required this.child,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32.w,
      height: 32.h,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(7.r),
            side: const BorderSide(
              color: AppColors.grey200,
              width: 1.5,
            ),
          ),
          backgroundColor: selected ? AppColors.primary : AppColors.white,
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

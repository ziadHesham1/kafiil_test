import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_test/common/app_colors.dart';

class NavigationButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final bool isSelected;
  const NavigationButton({
    super.key,
    this.onPressed,
    required this.child,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32.w,
      height: 32.h,
      child: MaterialButton(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(7.r),
          side: const BorderSide(
            color: AppColors.grey200,
            width: 1.5,
          ),
        ),
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

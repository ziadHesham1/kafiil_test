import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_colors.dart';

class SalaryFieldWidget extends StatefulWidget {
  final ValueChanged<int> addOnPressed;
  final ValueChanged<int> removeOnPressed;
  final int count;
  final String? labelText;
  final String? Function(String?)? validator;
  const SalaryFieldWidget({
    super.key,
    required this.count,
    required this.addOnPressed,
    required this.removeOnPressed,
    this.labelText,
    this.validator,
  });

  @override
  State<SalaryFieldWidget> createState() => _SalaryFieldWidgetState();
}

class _SalaryFieldWidgetState extends State<SalaryFieldWidget> {
  int currentNumber = 0;
  @override
  void initState() {
    super.initState();
    currentNumber = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    var styleFrom = IconButton.styleFrom(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.primary,
      minimumSize: Size(24.h, 24.w),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              widget.labelText!,
              style: const TextStyle(
                color: AppColors.grey500,
              ),
            ),
          ),
        Container(
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.grey50,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  style: styleFrom,
                  onPressed: currentNumber <= 1
                      ? null
                      : () {
                          currentNumber -= 1000;
                          widget.removeOnPressed(currentNumber);
                          setState(() {});
                        },
                  icon: const Icon(Icons.remove),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: FittedBox(
                    child: Text(
                      'SAR $currentNumber',
                      style: TextStyle(
                        color: AppColors.grey800,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: /* currentNumber >= widget.limit
                      ? null
                      : */
                      () {
                    currentNumber += 1000;

                    widget.addOnPressed(currentNumber);
                    setState(() {});
                  },
                  icon: const Icon(Icons.add),
                  style: styleFrom,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

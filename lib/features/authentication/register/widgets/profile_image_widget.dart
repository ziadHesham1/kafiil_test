import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_colors.dart';

class ProfileImageWidget extends StatelessWidget {
  final String imagePath;
  const ProfileImageWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(imagePath),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          height: 25.h,
          width: 25.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.white,
            size: 20,
          ),
        ),
      ),
    ]);
  }
}

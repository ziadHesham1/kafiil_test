import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_assets.dart';
import '../../../common/app_colors.dart';

class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 157.w,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(children: [
              Image.asset(AppAssets.service_image),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: 26.h,
                  width: 60.h,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: const Text(
                    '\$100',
                    style: TextStyle(
                        color: AppColors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ]),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 8.0.w,
              ),
              child: Column(
                children: [
                  Text(
                    'Logo Design -Graphic Design Graphic Design',
                    style: TextStyle(fontSize: 11.sp),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star,
                          color: AppColors.warning300, size: 20),
                      Text(
                        '(4.5)',
                        style: TextStyle(
                            fontSize: 11.sp, color: AppColors.warning300),
                      ),
                      Text(
                        ' |  ',
                        style: TextStyle(
                            fontSize: 11.sp, color: AppColors.grey600),
                      ),
                      Image.asset(AppAssets.basket_icon),
                      Text(
                        ' 20',
                        style: TextStyle(
                            fontSize: 11.sp, color: AppColors.grey600),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

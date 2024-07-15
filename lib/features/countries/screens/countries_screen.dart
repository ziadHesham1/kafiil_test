import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_colors.dart';
import '../widgets/pagination_navigator.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({
    super.key,
  });

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  Widget build(BuildContext context) {
    var itemsList = List.generate(8, (index) => index).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 40.h,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    margin:
                        EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: AppColors.grey50,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Country',
                          style: TextStyle(color: AppColors.grey500),
                        ),
                        Text(
                          'Capital',
                          style: TextStyle(color: AppColors.grey500),
                        ),
                      ],
                    ),
                  ),
                  ...itemsList.asMap().entries.map((item) {
                    return countryRow(
                        lastItem: item.key == itemsList.length - 1);
                  }),
                  SizedBox(height: 6.h)
                ],
              ),
            ),
            SizedBox(height: 24.h),
            PaginationNavigator(length: 10, onChanged: (i) {})
          ],
        ),
      ),
    );
  }

  Widget countryRow({required bool lastItem}) {
    return Column(
      children: [
        SizedBox(
          height: 33.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Egypt',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Cairo',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        if (!lastItem) const Divider(color: AppColors.grey200),
      ],
    );
  }
}

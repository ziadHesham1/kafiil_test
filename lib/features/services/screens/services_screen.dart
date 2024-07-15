import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/scrollable_row_widget.dart';
import '../widgets/service_card_widget.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // serviceTitleWidget('Services'),
            const ScrollableRowWidget(
              list: [
                ServiceCardWidget(),
                ServiceCardWidget(),
                ServiceCardWidget(),
                ServiceCardWidget(),
              ],
            ),
            serviceTitleWidget('Popular Services'),
            const ScrollableRowWidget(
              list: [
                ServiceCardWidget(),
                ServiceCardWidget(),
                ServiceCardWidget(),
                ServiceCardWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceTitleWidget(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}

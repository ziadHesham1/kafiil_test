import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_icon_data.dart';
import 'navigation_button.dart';
import 'number_button.dart';

class PaginationNavigator extends StatefulWidget {
  final int length;

  final Function(int) onChanged;
  final int? pagerIndex;
  const PaginationNavigator({
    super.key,
    required this.length,
    required this.onChanged,
    this.pagerIndex,
  });

  @override
  State<PaginationNavigator> createState() => _PaginationNavigatorState();
}

class _PaginationNavigatorState extends State<PaginationNavigator> {
  int currentIndex = 1;
  bool isArabic = false;
  final int limit = 3;

  void updateIndex(int value) {
    setState(() {
      currentIndex = value;
    });

    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    currentIndex =
        widget.pagerIndex != null ? widget.pagerIndex! : currentIndex;
    List<int> pagesList = calculatePagesList();
    print('pagesList = $pagesList,current = $currentIndex');

    List<Widget> children = [
      NavigationButton(
        child: const Icon(
          AppIconData.first,
          size: 20,
          color: AppColors.grey300,
        ),
        onPressed: () {
          updateIndex(1);
        },
      ),
      NavigationButton(
        onPressed: () {
          if (currentIndex > 1) {
            updateIndex(currentIndex - 1);
          }
        },
        child: const Icon(
          Icons.chevron_left,
          size: 20,
          color: AppColors.grey300,
        ),
      ),
      ...pagesList.map(
        (index) {
          return NumberButton(
            selected: currentIndex == index + 1,
            onPressed: () {
              updateIndex(index + 1);
            },
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: currentIndex == index + 1
                    ? AppColors.white
                    : AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
      if (!pagesList.contains(widget.length - 1)) ...{
        SizedBox(
          width: 30.w,
          child: const Center(child: Text('...')),
        ),
        NumberButton(
          onPressed: () {
            updateIndex(widget.length);
          },
          child: Text(
            '${widget.length}',
            style: TextStyle(
              color: currentIndex == widget.length
                  ? AppColors.white
                  : AppColors.black,
            ),
          ),
        ),
      },
      NavigationButton(
        onPressed: () {
          if (currentIndex < widget.length) {
            updateIndex(currentIndex + 1);
          }
        },
        child: const Icon(
          Icons.chevron_right,
          size: 20,
          color: AppColors.grey300,
        ),
      ),
      NavigationButton(
        onPressed: () {
          updateIndex(widget.length);
        },
        child: const Icon(
          AppIconData.last,
          size: 20,
          color: AppColors.grey300,
        ),
      ),
    ];

    return SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ));
  }

  List<int> calculatePagesList() {
    final pagesLength = widget.length;
    List<int> list = [];
    // Calculate the start of the range based on the current index and the limit
    int start = ((currentIndex - 1) ~/ limit) * limit;
    // Calculate the end of the range ensuring it does not exceed the total number of pages
    int end = start + limit - 1;
    end = end > pagesLength ? pagesLength - 1 : end;
    print('start = $start, end = $end');
    // Add the pages in the range to the list
    for (int i = start; i <= end; i++) {
      list.add(i);
    }
    // Return the list of pages to be displayed
    return list;
  }
}

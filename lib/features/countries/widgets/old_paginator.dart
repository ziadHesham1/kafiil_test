import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';

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
  final int limit = 10;

  void updateIndex(int value) {
    setState(() {
      currentIndex = value;
    });

    widget.onChanged(value);
  }

  Widget rectangleContainer({required Widget child, Color? color}) {
    return Container(
      width: 60,
      height: 50,

      // padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    currentIndex =
        widget.pagerIndex != null ? widget.pagerIndex! : currentIndex;
    List<int> pagesList = calculatePagesList();

    List<Widget> children = [
      rectangleContainer(
        child: TextButton(
          onPressed: () {
            updateIndex(1);
          },
          child: Transform.flip(
            flipX: isArabic ? false : true,
            child: const Icon(
              color: AppColors.primary,
              Icons.fast_forward,
              size: 30,
            ),
          ),
        ),
      ),
      rectangleContainer(
        child: TextButton(
          onPressed: () {
            if (currentIndex > 1) {
              updateIndex(currentIndex - 1);
            }
          },
          child: Transform.flip(
            flipX: isArabic ? false : true,
            child: const Icon(
              color: AppColors.primary,
              Icons.play_arrow,
              size: 30,
            ),
          ),
        ),
      ),
      ...pagesList.map(
        (index) => rectangleContainer(
          color:
              currentIndex == index + 1 ? AppColors.primary : AppColors.white,
          child: MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              updateIndex(index + 1);
            },
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: currentIndex == index + 1
                    ? AppColors.white
                    : AppColors.primary,
              ),
            ),
          ),
        ),
      ),
      rectangleContainer(
        child: TextButton(
          onPressed: () {
            if (currentIndex < widget.length) {
              updateIndex(currentIndex + 1);
            }
          },
          child: Transform.flip(
            flipX: isArabic ? true : false,
            child: const Icon(
              color: AppColors.primary,
              Icons.play_arrow,
              size: 30,
            ),
          ),
        ),
      ),
      rectangleContainer(
        child: TextButton(
          onPressed: () {
            updateIndex(widget.length);
          },
          child: Transform.flip(
            flipX: isArabic ? true : false,
            child: const Icon(
              color: AppColors.primary,
              Icons.fast_forward,
              size: 30,
            ),
          ),
        ),
      ),
    ];

    return SizedBox(
      width: double.maxFinite,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: children,
      ),
    );
  }

  List<int> calculatePagesList() {
    List<int> list = [];
    // Calculate the start of the range based on the current index and the limit
    int start = ((currentIndex - 1) ~/ limit) * limit;
    // Calculate the end of the range ensuring it does not exceed the total number of pages
    int end = start + limit - 1;
    end = end > widget.length ? widget.length - 1 : end;

    // Add the pages in the range to the list
    for (int i = start; i <= end; i++) {
      list.add(i);
    }
    // Return the list of pages to be displayed
    return list;
  }
}

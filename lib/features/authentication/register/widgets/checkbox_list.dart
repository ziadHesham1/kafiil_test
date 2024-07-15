import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_colors.dart';

class CheckboxList extends StatefulWidget {
  final List<SocialMediaModel> options;
  final ValueChanged<List<SocialMediaModel>> onSelectionChanged;
  final String? labelText;

  const CheckboxList({
    super.key,
    required this.options,
    required this.onSelectionChanged,
    this.labelText,
  });

  @override
  State<CheckboxList> createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {
  late List<SocialMediaModel> currentOptions;

  @override
  void initState() {
    super.initState();
    currentOptions = widget.options;
  }

  void _onCheckboxChanged(int index, bool? value) {
    setState(() {
      currentOptions[index] =
          currentOptions[index].copyWith(selected: value ?? false);
    });
    widget.onSelectionChanged(currentOptions);
  }

  @override
  Widget build(BuildContext context) {
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
        ...currentOptions.asMap().entries.map((entry) {
          final int index = entry.key;
          final SocialMediaModel item = entry.value;
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: item.selected,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.r)),
                ),
                side: item.selected
                    ? null
                    : WidgetStateBorderSide.resolveWith(
                        (states) =>
                            const BorderSide(width: 1.0, color: Colors.grey),
                      ),
                onChanged: (bool? value) {
                  _onCheckboxChanged(index, value);
                },
              ),
              Image.asset(item.iconPath),
              SizedBox(width: 8.w),
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}

class SocialMediaModel {
  final String name;
  final String iconPath;
  final bool selected;

  SocialMediaModel({
    required this.name,
    required this.iconPath,
    this.selected = false,
  });

  SocialMediaModel copyWith({
    String? name,
    String? iconPath,
    bool? selected,
  }) {
    return SocialMediaModel(
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      selected: selected ?? this.selected,
    );
  }

  @override
  String toString() => '$name : $selected';
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../../common/app_colors.dart';

class SkillsField extends StatefulWidget {
  final String? labelText;
  final String? Function(String?)? validator;
  const SkillsField({
    super.key,
    this.labelText,
    this.validator,
  });

  @override
  State<SkillsField> createState() => _SkillsFieldState();
}

class _SkillsFieldState extends State<SkillsField> {
  late StringTagController _stringTagController;

  @override
  void initState() {
    super.initState();
    _stringTagController = StringTagController();
  }

  @override
  void dispose() {
    super.dispose();
    _stringTagController.dispose();
  }

  static const List<String> _initialTags = <String>[
    'Video Production',
    'Video Production',
  ];

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(16.r),
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
        TextFieldTags<String>(
          textfieldTagsController: _stringTagController,
          initialTags: _initialTags,
          textSeparators: const [','],
          letterCase: LetterCase.normal,
          validator: (String tag) {
            if (widget.validator != null) widget.validator!(tag);
            if (_stringTagController.getTags!.contains(tag)) {
              return 'You\'ve already entered that';
            }
            return null;
          },
          inputFieldBuilder: (context, inputFieldValues) {
            return TextField(
              onTap: () {
                _stringTagController.getFocusNode?.requestFocus();
              },
              controller: inputFieldValues.textEditingController,
              focusNode: inputFieldValues.focusNode,
              maxLines: 3,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.grey50,
                focusColor: AppColors.grey50,
                border: outlineInputBorder,
                errorBorder: outlineInputBorder,
                disabledBorder: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                helperStyle: const TextStyle(color: AppColors.primary100),
                errorText: inputFieldValues.error,
                // prefixIconConstraints:
                //     BoxConstraints(maxWidth: _distanceToField * 0.8),
                prefixIcon: inputFieldValues.tags.isNotEmpty
                    ? Wrap(
                        children: inputFieldValues.tags.map((String tag) {
                          return itemWidget(tag, inputFieldValues);
                        }).toList(),
                      )
                    : null,
              ),
              onChanged: inputFieldValues.onTagChanged,
              onSubmitted: inputFieldValues.onTagSubmitted,
            );
          },
        ),
      ],
    );
  }

  Container itemWidget(String tag, InputFieldValues<String> inputFieldValues) {
    return Container(
      height: 34.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: AppColors.primary100,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            child: Text(
              tag,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 12.sp,
              ),
            ),
            onTap: () {
              //print("$tag selected");
            },
          ),
          const SizedBox(width: 4.0),
          InkWell(
            child: const Icon(
              Icons.close,
              size: 14.0,
              color: AppColors.primary,
            ),
            onTap: () {
              inputFieldValues.onTagRemoved(tag);
            },
          )
        ],
      ),
    );
  }
}

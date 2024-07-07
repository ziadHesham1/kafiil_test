import 'package:flutter/material.dart';

import '../../../../common/app_colors.dart';

class RadioButtonGroup extends StatefulWidget {
  final List<String> options;
  final String? labelText;
  final Function(String value) onSelectionChanged;
  const RadioButtonGroup({
    super.key,
    required this.options,
    required this.onSelectionChanged,
    this.labelText,
  });

  @override
  State<RadioButtonGroup> createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  String selectedIndex = '';
  @override
  void initState() {
    super.initState();
    if (widget.options.isNotEmpty) {
      selectedIndex = widget.options.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText!,
            style: const TextStyle(
              color: AppColors.grey500,
            ),
          ),
        Row(
            children: widget.options.asMap().entries.map(
          (entry) {
            return Row(
              children: [
                Radio<String>(
                  value: entry.value,
                  groupValue: selectedIndex,
                  onChanged: (value) {
                    selectedIndex = entry.value;
                    widget.onSelectionChanged(selectedIndex);
                    setState(() {});
                  },
                ),
                Text(entry.value),
              ],
            );
          },
        ).toList()),
      ],
    );
  }
}

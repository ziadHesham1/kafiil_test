import 'package:flutter/material.dart';
import 'package:kafiil_test/common/app_colors.dart';

import 'app_text_field.dart';

class AppPasswordField extends StatefulWidget {
  final Function(String?)? onSaved;
  final String labelText;
  final String? Function(String?)? validator;

  final String? initialValue;
  final FocusNode? focusNode;
  final bool filled;
  const AppPasswordField({
    super.key,
    this.onSaved,
    required this.labelText,
    this.initialValue,
    this.focusNode,
    this.validator,
    this.filled = false,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool isHiddenPass = true;

  void _togglePass() {
    setState(() {
      isHiddenPass = !isHiddenPass;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      // filled: widget.filled,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      labelText: widget.labelText,
      validator: widget.validator,
      textInputAction: TextInputAction.done,
      isObscureText: isHiddenPass,
      suffixIcon: InkWell(
        onTap: _togglePass,
        focusNode: widget.focusNode,
        child: isHiddenPass
            ? const Icon(
                Icons.visibility_off,
                color: AppColors.grey400,
                // size: Constants._screen_height / 35,
              )
            : const Icon(
                Icons.visibility,
                color: AppColors.grey400,

                // size: Constants._screen_height / 35,
              ),
      ),
      // validator: Validations().passwordValidator,
      onSaved: widget.onSaved,
    );
  }
}

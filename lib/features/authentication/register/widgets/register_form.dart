import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_validations.dart';
import '../../../../common/widgets/buttons/app_elevated_button.dart';
import '../../../../common/widgets/fields/app_password_field.dart';
import '../../../../common/widgets/fields/app_text_field.dart';
import '../../../../common/widgets/radio_button_group.dart';

class RegisterForm extends StatefulWidget {
  final void Function(bool) onValidationTriggered;
  final void Function() onNextButtonPressed;

  const RegisterForm({
    super.key,
    required this.onValidationTriggered,
    required this.onNextButtonPressed,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool validationError = false;

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    labelText: 'First Name',
                    validator: (value) {
                      final result = AppValidations.validateName(value);

                      return result;
                    },
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: AppTextField(
                    labelText: 'Last Name',
                    validator: (value) {
                      final result = AppValidations.validateName(value);

                      return result;
                    },
                  ),
                ),
              ],
            ),
            AppTextField(
              labelText: 'Email Address',
              validator: (value) {
                final result = AppValidations.validateEmail(value);

                return result;
              },
            ),
            AppPasswordField(
              labelText: 'Password',
              controller: _passwordController,
              validator: (value) {
                final result = AppValidations.validatePassword(value);

                return result;
              },
            ),
            AppPasswordField(
              labelText: 'Confirm Password',
              validator: (value) {
                final result = AppValidations.validateConfirmPassword(
                    value, _passwordController.text);

                return result;
              },
            ),
            RadioButtonGroup(
              labelText: 'User Type',
              options: const ['Seller', 'Buyer', 'Both'],
              onSelectionChanged: (index) {
                print('value = $index');
              },
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: LayoutBuilder(
                  builder: (context, constraints) => AppElevatedButton(
                    onPressed: () {
                      widget.onValidationTriggered(
                          _formKey.currentState!.validate());

                      if (_formKey.currentState!.validate()) {
                        widget.onNextButtonPressed();
                      }
                    },
                    label: 'Next',
                    width: constraints.maxWidth / 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_navbar.dart';
import '../../../../common/app_validations.dart';
import '../../../../common/widgets/buttons/app_checkbox.dart';
import '../../../../common/widgets/buttons/app_elevated_button.dart';
import '../../../../common/widgets/buttons/app_text_button.dart';
import '../../../../common/widgets/fields/app_password_field.dart';
import '../../../../common/widgets/fields/app_text_field.dart';

class LoginForm extends StatefulWidget {
  final void Function(bool) onValidationTriggered;

  const LoginForm({super.key, required this.onValidationTriggered});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextField(
              labelText: 'Email Address',
              validator: (value) {
                final String? result = AppValidations.validateEmail(value);
                // widget.onValidationTriggered(result != null);
                return result;
              },
            ),
            AppPasswordField(
              labelText: 'Password',
              validator: (value) {
                final String? result = AppValidations.validatePassword(value);
                // widget.onValidationTriggered(result != null);
                return result;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppCheckbox(
                  label: 'Remember me',
                  onChanged: (bool value) {},
                ),
                AppTextButton(
                  onPressed: () {},
                  label: 'Forgot Password?',
                ),
              ],
            ),
            SizedBox(height: 16.h),
            AppElevatedButton(
              onPressed: () {
                widget.onValidationTriggered(_formKey.currentState!.validate());
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AppNavBar(),
                  ));
                }
              },
              label: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}

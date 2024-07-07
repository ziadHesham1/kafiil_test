import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/fields/app_password_field.dart';
import '../../../../common/fields/app_text_field.dart';
import '../../../../common/buttons/app_checkbox.dart';
import '../../../../common/buttons/app_elevated_button.dart';
import '../../../../common/buttons/app_text_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const AppTextField(
            labelText: 'Email Address',
          ),
          const AppPasswordField(labelText: 'Password'),
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
            onPressed: () {},
            label: 'Login',
          ),
        ],
      ),
    );
  }
}

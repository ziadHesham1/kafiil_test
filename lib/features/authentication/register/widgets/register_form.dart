import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_test/features/authentication/register/widgets/radio_button_group.dart';

import '../../../../common/fields/app_password_field.dart';
import '../../../../common/fields/app_text_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: AppTextField(
                  labelText: 'First Name',
                ),
              ),
              SizedBox(width: 16.w),
              const Expanded(
                child: AppTextField(
                  labelText: 'Last Name',
                ),
              ),
            ],
          ),
          const AppTextField(
            labelText: 'Email Address',
          ),
          const AppPasswordField(labelText: 'Password'),
          const AppPasswordField(labelText: 'Confirm Password'),
          RadioButtonGroup(
            labelText: 'User Type',
            options: const ['Seller', 'Buyer', 'Both'],
            onSelectionChanged: (index) {
              print('value = $index');
            },
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

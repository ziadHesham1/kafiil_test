import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_assets.dart';
import '../../../../common/buttons/app_text_button.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Login',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppAssets.login_illustration_image,
            ),
          ),
          const LoginForm(),
          AppTextButton(
            onPressed: () {},
            label: 'Register',
            leadingText: 'Don\'t have an account?',
          ),
        ],
      ),
    );
  }
}

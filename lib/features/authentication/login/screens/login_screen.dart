import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/widgets/validation_error_widget.dart';
import '../../register/screens/register_screen.dart';

import '../../../../common/app_assets.dart';
import '../../../../common/widgets/buttons/app_text_button.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool validationError = false;
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
                visible: validationError,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: const ValidationErrorWidget(),
                )),
            Center(
              child: Image.asset(
                AppAssets.login_illustration_image,
              ),
            ),
            LoginForm(
              onValidationTriggered: (p0) {
                validationError = p0;
                setState(() {});
              },
            ),
            SizedBox(height: 16.h),
            AppTextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ));
              },
              label: 'Register',
              leadingText: 'Don\'t have an account?',
            ),
          ],
        ),
      ),
    );
  }
}

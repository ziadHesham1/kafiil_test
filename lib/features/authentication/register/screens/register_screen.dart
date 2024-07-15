import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/validation_error_widget.dart';
import '../widgets/complete_register_data_form.dart';
import '../widgets/register_form.dart';
import '../widgets/register_process_timeline_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _processIndex = 0;
  bool validationError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
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
            SizedBox(
              height: 130.h,
              child: RegisterProcessWidget(processIndex: _processIndex),
            ),
            if (_processIndex == 0)
              RegisterForm(
                onValidationTriggered: (p0) {
                  validationError = p0;
                  setState(() {});
                },
                onNextButtonPressed: () {
                  if (_processIndex < 1) {
                    _processIndex++;
                    validationError = false;
                    setState(() {});
                  }
                },
              ),
            if (_processIndex == 1)
              CompleteRegisterDataForm(
                onValidationTriggered: (p0) {
                  validationError = p0;
                  setState(() {});
                },
              ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

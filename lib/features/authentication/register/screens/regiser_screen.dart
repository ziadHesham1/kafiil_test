import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/buttons/app_elevated_button.dart';
import '../widgets/register_form.dart';
import '../widgets/register_process_timeline_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _processIndex = 0;
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
            SizedBox(
              height: 150,
              child: RegisterProcessWidget(processIndex: _processIndex),
            ),
            const RegisterForm(),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: LayoutBuilder(
                  builder: (context, constraints) => AppElevatedButton(
                    onPressed: () {
                      if (_processIndex < 1) {
                        _processIndex++;
                        setState(() {});
                      }
                    },
                    label: _processIndex == 0 ? 'Next' : 'Submit',
                    width: _processIndex == 0 ? constraints.maxWidth / 2 : null,
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

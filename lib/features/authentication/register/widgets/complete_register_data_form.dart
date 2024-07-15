import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_test/common/app_validations.dart';

import '../../../../app_navbar.dart';
import '../../../../common/app_assets.dart';
import '../../../../common/widgets/buttons/app_elevated_button.dart';
import '../../../../common/widgets/fields/app_date_field.dart';
import '../../../../common/widgets/fields/app_text_field.dart';
import '../../../../common/widgets/radio_button_group.dart';
import 'checkbox_list.dart';
import 'profile_image_widget.dart';
import 'salary_field_widget.dart';
import 'skills_field.dart';

class CompleteRegisterDataForm extends StatefulWidget {
  final void Function(bool) onValidationTriggered;

  const CompleteRegisterDataForm({
    super.key,
    required this.onValidationTriggered,
  });

  @override
  State<CompleteRegisterDataForm> createState() =>
      _CompleteRegisterDataFormState();
}

class _CompleteRegisterDataFormState extends State<CompleteRegisterDataForm> {
  final _formKey = GlobalKey<FormState>();
  bool validationError = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ProfileImageWidget(
              imagePath: AppAssets.person_illustration_image,
            ),
            AppTextField(
              labelText: 'About',
              maxLines: 6,
              validator: (value) {
                final result = AppValidations.validateAbout(value);
                widget.onValidationTriggered(result != null);
                return result;
              },
            ),
            SalaryFieldWidget(
              labelText: 'Salary',
              count: 1000,
              addOnPressed: (int value) {},
              removeOnPressed: (int value) {},
              validator: (String? value) {
                final result =
                    AppValidations.validateSalary(int.parse(value ?? '-1'));
                // if (!validationError) {
                //   validationError = result != null;
                // }

                // widget.onValidationTriggered(validationError);
                return result;
              },
            ),
            AppDateField(
              labelText: 'Birth Date',
              onTap: (DateTime date) {},
              // validator: (String? value) {
              //   final result = AppValidations.validateDate(value);
              //   if (!validationError) {
              //     validationError = result != null;
              //   }
              //   widget.onValidationTriggered(validationError);
              //   return result;
              // },
              validator: AppValidations.validateDate,
            ),
            RadioButtonGroup(
              labelText: 'Gender',
              options: const ['Male', 'Female'],
              onSelectionChanged: (index) {},
            ),
            const SkillsField(
              labelText: 'Skills',
              // validator: (value) {
              //   final result = AppValidations.validateSkills(value);
              //   if (!validationError) {
              //     validationError = result != null;
              //   }
              //   widget.onValidationTriggered(validationError);
              //   return result;
              // },
              validator: AppValidations.validateSkills,
            ),
            CheckboxList(
              labelText: 'Favorite Social Media',
              options: [
                SocialMediaModel(
                    name: 'Facebook', iconPath: AppAssets.facebook_icon),
                SocialMediaModel(
                    name: 'Twitter', iconPath: AppAssets.twitter_icon),
                SocialMediaModel(
                    name: 'LinkedIn', iconPath: AppAssets.linkedin_icon),
              ],
              onSelectionChanged: (value) {},
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
              label: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}

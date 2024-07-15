import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_assets.dart';
import '../../../common/widgets/fields/app_date_field.dart';
import '../../../common/widgets/fields/app_password_field.dart';
import '../../../common/widgets/fields/app_text_field.dart';
import '../../../common/widgets/radio_button_group.dart';
import '../../authentication/register/widgets/checkbox_list.dart';
import '../../authentication/register/widgets/profile_image_widget.dart';
import '../../authentication/register/widgets/skills_field.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Who Am I'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            Center(
                child: ProfileImageWidget(imagePath: AppAssets.profile_image)),
            SizedBox(height: 20.h),
            Row(
              children: [
                const Expanded(
                    child: AppTextField(
                        initialValue: 'Mahmoud', labelText: 'First Name')),
                SizedBox(width: 16.w),
                const Expanded(
                    child: AppTextField(
                        initialValue: 'Mohamed', labelText: 'Last Name')),
              ],
            ),
            const AppTextField(
                initialValue: 'mahmoud47@gmail.com',
                labelText: 'Email Address'),
            const AppPasswordField(
                initialValue: '12345678', labelText: 'Password'),
            RadioButtonGroup(
              labelText: 'User Type',
              options: const ['Seller', 'Buyer', 'Both'],
              onSelectionChanged: (index) {
                print('value = $index');
              },
            ),
            const AppTextField(
              initialValue:
                  'Lorem ipsum dolor sit amet consectetur. Odio urna sed velit et sed quis. Enim ut sed. sed quis. Enim ut sed.',
              labelText: 'about',
              maxLines: 6,
            ),
            const AppTextField(
              initialValue: 'SAR 4500',
              labelText: 'Salary',
            ),
            AppDateField(
              labelText: 'Birth Date',
              initialValue: '2000-12-07',
              onTap: (DateTime date) {},
            ),
            RadioButtonGroup(
              labelText: 'Gender',
              options: const ['Male', 'Female'],
              onSelectionChanged: (index) {},
            ),
            const SkillsField(labelText: 'Skills'),
            CheckboxList(
              labelText: 'Favorite Social Media',
              options: [
                SocialMediaModel(
                    name: 'Facebook',
                    iconPath: AppAssets.facebook_icon,
                    selected: true),
                SocialMediaModel(
                    name: 'Twitter', iconPath: AppAssets.twitter_icon),
                SocialMediaModel(
                    name: 'LinkedIn', iconPath: AppAssets.linkedin_icon)
              ],
              onSelectionChanged: (List<SocialMediaModel> value) {},
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/app_colors.dart';
import 'features/authentication/login/screens/login_screen.dart';
import 'features/countries/screens/countries_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              buttonTheme: const ButtonThemeData(
                buttonColor: AppColors.primary,
                textTheme: ButtonTextTheme.primary,
              ),
              primaryColor: AppColors.primary,
              unselectedWidgetColor: AppColors.grey300,
              fontFamily: 'Montserrat',
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(color: Colors.white),
              useMaterial3: true,
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: Colors.white,
                primary: const Color(0xff1DBF73),
              ),
            ),
            home: const LoginScreen(),
          );
        });
  }
}

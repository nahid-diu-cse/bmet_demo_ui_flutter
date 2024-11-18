import 'package:bmet_ui/res/getx_localization/languages.dart';
import 'package:bmet_ui/res/routes/routes.dart';
import 'package:bmet_ui/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child)=>GetMaterialApp(
        title: 'Flutter Demo',
        translations: Languages(),
        locale: Locale('en','US'),
        fallbackLocale: Locale('en','US'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: LoginScreen(),
        getPages: AppRoutes.appRoutes(),
      ),
    );
  }
}

// ElevatedButton(
// onPressed: () {},
// style: ElevatedButton.styleFrom(
// backgroundColor: Colors.green,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8),
// ),
// padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// ),
// child: Text('এটা কি?', style: TextStyle(color: Colors.white, fontSize: 12)),
// ),





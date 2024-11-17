import 'package:bmet_ui/res/getx_localization/languages.dart';
import 'package:bmet_ui/res/routes/routes.dart';
import 'package:bmet_ui/screen/bank_details/bank_details_screen.dart';
import 'package:bmet_ui/screen/clearance/bmet_clearance_screen.dart';
import 'package:bmet_ui/screen/clearance/clearance_step_screen.dart';
import 'package:bmet_ui/screen/employee_details/employee_details_screen.dart';
import 'package:bmet_ui/screen/employee_details/employee_works_details_screen.dart';
import 'package:bmet_ui/screen/home/home_screen.dart';
import 'package:bmet_ui/screen/login/login_screen.dart';
import 'package:bmet_ui/screen/mandatory/mandatory_screen.dart';
import 'package:bmet_ui/screen/medical_details/medical_details_screen.dart';
import 'package:bmet_ui/screen/pdo_biometric/pdo_biometric_screen.dart';
import 'package:bmet_ui/screen/splash_screen.dart';
import 'package:bmet_ui/screen/summary/documents_summary_screen.dart';
import 'package:bmet_ui/screen/summary/payment_summary_screen.dart';
import 'package:bmet_ui/screen/summary/total_summary_screen.dart';
import 'package:bmet_ui/screen/visa_details/visa_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Languages(),
      locale: Locale('en','US'),
      fallbackLocale: Locale('en','US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(),
      getPages: AppRoutes.appRoutes(),
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





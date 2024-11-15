import 'dart:async';

import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../controller/user_preference/user_preferences_view_model.dart';
class SplashServices {
  UserPreferences userPreferences = UserPreferences();

  void isLogin() {
    userPreferences
        .getUser()
        .then((value) => {
              if (value.isLogin==false || value.isLogin.toString() == 'null')
                {
                  Timer(const Duration(seconds: 3),
                      () => Get.toNamed(RoutesName.loginScreen)),
                }
              else
                {
                  Timer(const Duration(seconds: 3),
                      () => Get.toNamed(RoutesName.homeScreen)),
                }
            })
        .onError((error, stackTrace)=>{
          Utils.snackBar('Splash error', '$error')
    });
  }
}

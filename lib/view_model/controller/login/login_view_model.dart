import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/login/login_response_model.dart';
import '../../../repository/login_repository/login_repository.dart';
import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../user_preference/user_preferences_view_model.dart';
class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  UserPreferences userPreferences = UserPreferences();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool isLoading = false.obs;

  void loginApi() {
    isLoading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      isLoading.value = false;
      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        LoginResponseModel loginResponseModel = LoginResponseModel(
          token: value['token'],
          isLogin: true,
        );
        userPreferences
            .saveUser(loginResponseModel)
            .then((value) => {
                  Get.toNamed(RoutesName.homeScreen),
                })
            .onError((error, stackTrace) => {});
        Utils.snackBar('Login', 'Login Successfully');
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}

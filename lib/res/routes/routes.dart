import 'package:bmet_ui/res/routes/routes_name.dart';
import 'package:get/get.dart';
import '../../screen/home/home_screen.dart';
import '../../screen/login/login_screen.dart';
import '../../screen/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RoutesName.loginScreen,
          page: () => const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),

        GetPage(
          name: RoutesName.homeScreen,
          page: () => HomeScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),

    GetPage(
      name: RoutesName.bmetClearanceScreen,
      page: () => HomeScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRight,
    ),
      ];
}
